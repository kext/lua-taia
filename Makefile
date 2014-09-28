COMPILE = $(CC) -c -Isrc/taia
MAKELIB = $(AR) rcs

static: build/libtaia.a

lua:
	luarocks make

build/libtaia.a: build/objects/taia/caldate_fmjd.o build/objects/taia/caldate_fmt.o build/objects/taia/caldate_mjd.o build/objects/taia/caldate_norm.o build/objects/taia/caldate_scan.o build/objects/taia/caldate_ster.o build/objects/taia/caltime_fmt.o build/objects/taia/caltime_scan.o build/objects/taia/caltime_tai.o build/objects/taia/caltime_utc.o build/objects/taia/leapsecs_add.o build/objects/taia/leapsecs_init.o build/objects/taia/leapsecs_read.o build/objects/taia/leapsecs_sub.o build/objects/taia/tai_add.o build/objects/taia/tai_now.o build/objects/taia/tai_pack.o build/objects/taia/tai_sub.o build/objects/taia/tai_unpack.o build/objects/taia/taia_add.o build/objects/taia/taia_approx.o build/objects/taia/taia_fmtfrac.o build/objects/taia/taia_frac.o build/objects/taia/taia_half.o build/objects/taia/taia_less.o build/objects/taia/taia_now.o build/objects/taia/taia_pack.o build/objects/taia/taia_sub.o build/objects/taia/taia_tai.o build/objects/taia/taia_unpack.o Makefile
	@echo [AR] build/libtaia.a
	@mkdir -p build/
	@$(MAKELIB) build/libtaia.a build/objects/taia/caldate_fmjd.o build/objects/taia/caldate_fmt.o build/objects/taia/caldate_mjd.o build/objects/taia/caldate_norm.o build/objects/taia/caldate_scan.o build/objects/taia/caldate_ster.o build/objects/taia/caltime_fmt.o build/objects/taia/caltime_scan.o build/objects/taia/caltime_tai.o build/objects/taia/caltime_utc.o build/objects/taia/leapsecs_add.o build/objects/taia/leapsecs_init.o build/objects/taia/leapsecs_read.o build/objects/taia/leapsecs_sub.o build/objects/taia/tai_add.o build/objects/taia/tai_now.o build/objects/taia/tai_pack.o build/objects/taia/tai_sub.o build/objects/taia/tai_unpack.o build/objects/taia/taia_add.o build/objects/taia/taia_approx.o build/objects/taia/taia_fmtfrac.o build/objects/taia/taia_frac.o build/objects/taia/taia_half.o build/objects/taia/taia_less.o build/objects/taia/taia_now.o build/objects/taia/taia_pack.o build/objects/taia/taia_sub.o build/objects/taia/taia_tai.o build/objects/taia/taia_unpack.o
build/objects/taia/caldate_fmjd.o: src/caldate_fmjd.c Makefile
	@echo [CC] build/objects/taia/caldate_fmjd.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/caldate_fmjd.o src/caldate_fmjd.c
build/objects/taia/caldate_fmt.o: src/caldate_fmt.c Makefile
	@echo [CC] build/objects/taia/caldate_fmt.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/caldate_fmt.o src/caldate_fmt.c
build/objects/taia/caldate_mjd.o: src/caldate_mjd.c Makefile
	@echo [CC] build/objects/taia/caldate_mjd.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/caldate_mjd.o src/caldate_mjd.c
build/objects/taia/caldate_norm.o: src/caldate_norm.c Makefile
	@echo [CC] build/objects/taia/caldate_norm.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/caldate_norm.o src/caldate_norm.c
build/objects/taia/caldate_scan.o: src/caldate_scan.c Makefile
	@echo [CC] build/objects/taia/caldate_scan.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/caldate_scan.o src/caldate_scan.c
build/objects/taia/caldate_ster.o: src/caldate_ster.c Makefile
	@echo [CC] build/objects/taia/caldate_ster.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/caldate_ster.o src/caldate_ster.c
build/objects/taia/caltime_fmt.o: src/caltime_fmt.c Makefile
	@echo [CC] build/objects/taia/caltime_fmt.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/caltime_fmt.o src/caltime_fmt.c
build/objects/taia/caltime_scan.o: src/caltime_scan.c Makefile
	@echo [CC] build/objects/taia/caltime_scan.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/caltime_scan.o src/caltime_scan.c
build/objects/taia/caltime_tai.o: src/caltime_tai.c Makefile
	@echo [CC] build/objects/taia/caltime_tai.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/caltime_tai.o src/caltime_tai.c
build/objects/taia/caltime_utc.o: src/caltime_utc.c Makefile
	@echo [CC] build/objects/taia/caltime_utc.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/caltime_utc.o src/caltime_utc.c
build/objects/taia/leapsecs_add.o: src/leapsecs_add.c Makefile
	@echo [CC] build/objects/taia/leapsecs_add.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/leapsecs_add.o src/leapsecs_add.c
build/objects/taia/leapsecs_init.o: src/leapsecs_init.c Makefile
	@echo [CC] build/objects/taia/leapsecs_init.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/leapsecs_init.o src/leapsecs_init.c
build/objects/taia/leapsecs_read.o: src/leapsecs_read.c Makefile
	@echo [CC] build/objects/taia/leapsecs_read.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/leapsecs_read.o src/leapsecs_read.c
build/objects/taia/leapsecs_sub.o: src/leapsecs_sub.c Makefile
	@echo [CC] build/objects/taia/leapsecs_sub.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/leapsecs_sub.o src/leapsecs_sub.c
build/objects/taia/tai_add.o: src/tai_add.c Makefile
	@echo [CC] build/objects/taia/tai_add.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/tai_add.o src/tai_add.c
build/objects/taia/tai_now.o: src/tai_now.c Makefile
	@echo [CC] build/objects/taia/tai_now.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/tai_now.o src/tai_now.c
build/objects/taia/tai_pack.o: src/tai_pack.c Makefile
	@echo [CC] build/objects/taia/tai_pack.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/tai_pack.o src/tai_pack.c
build/objects/taia/tai_sub.o: src/tai_sub.c Makefile
	@echo [CC] build/objects/taia/tai_sub.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/tai_sub.o src/tai_sub.c
build/objects/taia/tai_unpack.o: src/tai_unpack.c Makefile
	@echo [CC] build/objects/taia/tai_unpack.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/tai_unpack.o src/tai_unpack.c
build/objects/taia/taia_add.o: src/taia_add.c Makefile
	@echo [CC] build/objects/taia/taia_add.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/taia_add.o src/taia_add.c
build/objects/taia/taia_approx.o: src/taia_approx.c Makefile
	@echo [CC] build/objects/taia/taia_approx.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/taia_approx.o src/taia_approx.c
build/objects/taia/taia_fmtfrac.o: src/taia_fmtfrac.c Makefile
	@echo [CC] build/objects/taia/taia_fmtfrac.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/taia_fmtfrac.o src/taia_fmtfrac.c
build/objects/taia/taia_frac.o: src/taia_frac.c Makefile
	@echo [CC] build/objects/taia/taia_frac.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/taia_frac.o src/taia_frac.c
build/objects/taia/taia_half.o: src/taia_half.c Makefile
	@echo [CC] build/objects/taia/taia_half.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/taia_half.o src/taia_half.c
build/objects/taia/taia_less.o: src/taia_less.c Makefile
	@echo [CC] build/objects/taia/taia_less.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/taia_less.o src/taia_less.c
build/objects/taia/taia_now.o: src/taia_now.c Makefile
	@echo [CC] build/objects/taia/taia_now.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/taia_now.o src/taia_now.c
build/objects/taia/taia_pack.o: src/taia_pack.c Makefile
	@echo [CC] build/objects/taia/taia_pack.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/taia_pack.o src/taia_pack.c
build/objects/taia/taia_sub.o: src/taia_sub.c Makefile
	@echo [CC] build/objects/taia/taia_sub.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/taia_sub.o src/taia_sub.c
build/objects/taia/taia_tai.o: src/taia_tai.c Makefile
	@echo [CC] build/objects/taia/taia_tai.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/taia_tai.o src/taia_tai.c
build/objects/taia/taia_unpack.o: src/taia_unpack.c Makefile
	@echo [CC] build/objects/taia/taia_unpack.o
	@mkdir -p build/objects/taia/
	@$(COMPILE) -o build/objects/taia/taia_unpack.o src/taia_unpack.c
clean:
	rm -rf build taia.so src/*.o
