#include "caldate.h"

static int64_t times365[4] = { 0, 365, 730, 1095 } ;
static int64_t times36524[4] = { 0, 36524L, 73048L, 109572L } ;
static int64_t montab[12] =
{ 0, 31, 61, 92, 122, 153, 184, 214, 245, 275, 306, 337 } ;
/* month length after february is (306 * m + 5) / 10 */

int64_t caldate_mjd(const struct caldate *cd)
{
  int64_t y;
  int64_t m;
  int64_t d;

  d = cd->day - 678882L;
  m = cd->month - 1;
  y = cd->year;

  d += 146097L * (y / 400);
  y %= 400;

  if (m >= 2) m -= 2; else { m += 10; --y; }

  y += (m / 12);
  m %= 12;
  if (m < 0) { m += 12; --y; }

  d += montab[m];

  d += 146097L * (y / 400);
  y %= 400;
  if (y < 0) { y += 400; d -= 146097L; }

  d += times365[y & 3];
  y >>= 2;

  d += 1461L * (y % 25);
  y /= 25;

  d += times36524[y & 3];

  return d;
}
