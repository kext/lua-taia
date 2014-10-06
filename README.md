# Lua Taia

Lua bindings for and major overhaul of djb’s [libtai](http://cr.yp.to/libtai.html).

## License

> The author disclaims copyright to this source code.
> In place of a legal notice, here is a blessing:
>
> * May you do good and not evil.
> * May you find forgiveness for yourself and forgive others.
> * May you share freely, never taking more than you give.

## Usage

You can use Taia in your Lua programs by including it with `taia = require("taia")`.

The taia functions work on taia objects, which represent times and durations with attosecond precision.
The `+` and `-` operators can be used to add or subtract times or durations.
It is also possible to use a normal Lua number, which will then be interpreted as a duration in seconds.

Taia objects may also be compared with the standard Lua comparison operators like `<`, `==` etc.

### taia.now()

The `taia.now` function returns the current time as a taia object.

### taia.utc(year, month, day, hour, minute, second)

The `taia.utc` function returns the specified UTC date and time as taia object.
If less precision is needed, arguments may be ommitted, so `taia.utc(2014, 9)` returns 2014-09-01 0:00:00 UTC.

### t:approx()

The `t:approx` method can be used on any taia object `t` encoding a duration.
It will return the duration in seconds as a floating point number.
