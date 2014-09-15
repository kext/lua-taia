#include "taia.h"
#include "caltime.h"
#include "lua.h"

static const int taia_metatable;

static int lua_is_taia(lua_State *L, int index)
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

static struct taia *lua_checktaia(lua_State *L, int index)
{
  if (lua_is_taia(L, index)) {
    return (struct taia *)lua_touserdata(L, index);
  } else {
    lua_pushliteral(L, "Invalid parameter.");
    lua_error(L);
    return 0;
  }
}

static int lua_pushtaia(lua_State *L, struct taia *t)
{
  lua_checkstack(L, 2);
  struct taia *u = lua_newuserdata(L, sizeof(struct taia));
  *u = *t;
  lua_rawgetp(L, LUA_REGISTRYINDEX, &taia_metatable);
  lua_setmetatable(L, -2);
  return 1;
}

static int lua_taia_now(lua_State *L)
{
  struct taia t;
  taia_now(&t);
  lua_pushtaia(L, &t);
  return 1;
}

static int lua_taia_tostring(lua_State *L)
{
  int l;
  char s[64];
  struct caltime ct;
  struct taia *t = lua_checktaia(L, 1);
  caltime_utc(&ct, t, 0, 0);
  l = caltime_fmt(s, &ct);
  lua_pushlstring(L, s, l);
  return 1;
}

#define FUNC(n, f) lua_pushliteral(L, n);\
  lua_pushcfunction(L, f);\
  lua_rawset(L, -3);

int luaopen_taia(lua_State *L)
{
  lua_newtable(L);
  FUNC("__tostring", lua_taia_tostring)
  lua_rawsetp(L, LUA_REGISTRYINDEX, &taia_metatable);
  lua_newtable(L);
  FUNC("now", lua_taia_now)
  return 1;
}
