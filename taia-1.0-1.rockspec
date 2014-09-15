package = "taia"
version = "1.0-1"

source = {
  url = "..."
}

dependencies = {
  "lua >= 5.2"
}

build = {
  type = "builtin",
  modules = {
    taia = {
      "src/lua_taia.c",
      "src/caldate_fmjd.c",
      "src/caldate_fmt.c",
      "src/caldate_mjd.c",
      "src/caldate_norm.c",
      "src/caldate_scan.c",
      "src/caldate_ster.c",
      "src/caltime_fmt.c",
      "src/caltime_scan.c",
      "src/caltime_tai.c",
      "src/caltime_utc.c",
      "src/leapsecs_add.c",
      "src/leapsecs_init.c",
      "src/leapsecs_read.c",
      "src/leapsecs_sub.c",
      "src/taia_add.c",
      "src/taia_approx.c",
      "src/tai_add.c",
      "src/taia_fmtfrac.c",
      "src/taia_frac.c",
      "src/taia_half.c",
      "src/taia_less.c",
      "src/taia_now.c",
      "src/taia_pack.c",
      "src/taia_sub.c",
      "src/taia_tai.c",
      "src/taia_unpack.c",
      "src/tai_now.c",
      "src/tai_pack.c",
      "src/tai_sub.c",
      "src/tai_unpack.c"
    }
  }
}
