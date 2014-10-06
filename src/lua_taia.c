#include "taia.h"
#include "caltime.h"
#include "lua.h"

static const int taia_metatable;

static void caltime_apply_offset(struct caltime *ct, int minutes)
{
  ct->offset += minutes;
  ct->minute += minutes;
  while (ct->minute >= 60) {
    ct->hour += 1;
    ct->minute -= 60;
  }
  while (ct->minute < 0) {
    ct->hour -= 1;
    ct->minute += 60;
  }
  while (ct->hour >= 24) {
    ct->date.day += 1;
    ct->hour -= 24;
  }
  while (ct->hour < 0) {
    ct->date.day -= 1;
    ct->hour += 24;
  }
  caldate_normalize(&ct->date);
}

int lua_is_taia(lua_State *L, int index)
{
  int r;
  lua_checkstack(L, 2);
  if (lua_getmetatable(L, index)) {
    lua_rawgetp(L, LUA_REGISTRYINDEX, &taia_metatable);
    r = lua_rawequal(L, -1, -2);
    lua_pop(L, 2);
    return r;
  }
  return 0;
}

int lua_pushtaia(lua_State *L, struct taia *t)
{
  lua_checkstack(L, 2);
  struct taia *u = lua_newuserdata(L, sizeof(struct taia));
  *u = *t;
  lua_rawgetp(L, LUA_REGISTRYINDEX, &taia_metatable);
  lua_setmetatable(L, -2);
  return 1;
}

struct taia *lua_checktaia(lua_State *L, int index)
{
  struct taia t;
  lua_Number n;
  if (lua_is_taia(L, index)) {
    return (struct taia *)lua_touserdata(L, index);
  } else if (lua_isnumber(L, index)) {
    n = lua_tonumber(L, index);
    t.sec.x = n; n -= t.sec.x;
    n *= 1000000000LL;
    t.nano = n; n -= t.nano;
    n *= 1000000000LL;
    t.atto = n; n -= t.atto;
    lua_checkstack(L, 1);
    lua_pushtaia(L, &t);
    lua_replace(L, index);
    return (struct taia *)lua_touserdata(L, index);
  } else {
    lua_pushliteral(L, "Invalid timestamp.");
    lua_error(L);
    return 0;
  }
}

static int lua_taia_now(lua_State *L)
{
  struct taia t;
  taia_now(&t);
  lua_pushtaia(L, &t);
  return 1;
}

#define MAX_DURATION 4000000000000000000LL

static int lua_taia_tostring(lua_State *L)
{
  int l;
  lua_Number sec;
  char str[64];
  struct caltime ct;
  struct taia *t = lua_checktaia(L, 1);
  if (t->sec.x > MAX_DURATION) {
    caltime_utc(&ct, &t->sec, 0, 0);
    /* XXX: Get correct offset. */
    caltime_apply_offset(&ct, 120);
    l = caltime_fmt(str, &ct);
    lua_pushlstring(L, str, l);
  } else {
    sec = taia_approx(t);
    lua_pushfstring(L, "%fs", sec);
  }
  return 1;
}

static int lua_taia_add(lua_State *L)
{
  struct taia *t1, *t2, t3;
  t1 = lua_checktaia(L, 1);
  t2 = lua_checktaia(L, 2);
  if (t1->sec.x > MAX_DURATION && t2->sec.x > MAX_DURATION) {
    lua_pushliteral(L, "Addition of two absolute times is pointless.");
    lua_error(L);
  }
  taia_add(&t3, t1, t2);
  lua_pushtaia(L, &t3);
  return 1;
}

static int lua_taia_sub(lua_State *L)
{
  struct taia *t1, *t2, t3;
  t1 = lua_checktaia(L, 1);
  t2 = lua_checktaia(L, 2);
  taia_sub(&t3, t1, t2);
  lua_pushtaia(L, &t3);
  return 1;
}

static int lua_taia_eq(lua_State *L)
{
  struct taia *t1, *t2;
  t1 = lua_checktaia(L, 1);
  t2 = lua_checktaia(L, 2);
  lua_pushboolean(L, t1->sec.x == t2->sec.x && t1->nano == t2->nano && t1->atto == t2->atto);
  return 1;
}

static int lua_taia_less(lua_State *L)
{
  struct taia *t1, *t2;
  t1 = lua_checktaia(L, 1);
  t2 = lua_checktaia(L, 2);
  lua_pushboolean(L, taia_less(t1, t2));
  return 1;
}

static int lua_taia_approx(lua_State *L)
{
  struct taia *t = lua_checktaia(L, 1);
  if (t->sec.x > MAX_DURATION) {
    lua_pushliteral(L, "approx can only be used with durations.");
    lua_error(L);
  }
  lua_pushnumber(L, taia_approx(t));
  return 1;
}

static lua_Number lua_number_default(lua_State *L, int index, lua_Number default_number)
{
  if (lua_isnumber(L, index)) {
    return lua_tonumber(L, index);
  } else {
    return default_number;
  }
}

static int lua_taia_utc(lua_State *L)
{
  struct taia t;
  struct caltime ct;
  ct.date.year = lua_number_default(L, 1, 1970);
  ct.date.month = lua_number_default(L, 2, 1);
  ct.date.day = lua_number_default(L, 3, 1);
  ct.hour = lua_number_default(L, 4, 0);
  ct.minute = lua_number_default(L, 5, 0);
  ct.second = lua_number_default(L, 6, 0);
  ct.offset = 0;
  caltime_tai(&ct, &t.sec);
  t.nano = 0;
  t.atto = 0;
  lua_pushtaia(L, &t);
  return 1;
}

#include <stdio.h>
static int lua_taia_debug(lua_State *L)
{
  char s[128];
  struct taia *t = lua_checktaia(L, 1);
  int l = snprintf(s, sizeof(s), "0x%016llx 0x%08llx 0x%08llx (%lld.%09lld.%09lld)", (long long)t->sec.x, (long long)t->nano, (long long)t->atto, (long long)t->sec.x, (long long)t->nano, (long long)t->atto);
  if (l >= sizeof(s)) l = sizeof(s) - 1;
  lua_pushlstring(L, s, l);
  return 1;
}

#define FUNC(n, f) lua_pushliteral(L, n);\
  lua_pushcfunction(L, f);\
  lua_rawset(L, -3)

int luaopen_taia(lua_State *L)
{
  lua_rawgetp(L, LUA_REGISTRYINDEX, &taia_metatable);
  if (!lua_istable(L, -1)) {
    lua_newtable(L);
    FUNC("__tostring", lua_taia_tostring);
    FUNC("__add", lua_taia_add);
    FUNC("__sub", lua_taia_sub);
    FUNC("__eq", lua_taia_eq);
    FUNC("__lt", lua_taia_less);
    lua_pushliteral(L, "__index");
    lua_newtable(L);
    FUNC("approx", lua_taia_approx);
    FUNC("debug", lua_taia_debug);
    lua_rawset(L, -3);
    lua_rawsetp(L, LUA_REGISTRYINDEX, &taia_metatable);
  }
  lua_pop(L, 1);
  lua_newtable(L);
  FUNC("now", lua_taia_now);
  FUNC("utc", lua_taia_utc);
  return 1;
}
