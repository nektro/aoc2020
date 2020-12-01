# Advent Of Code 2020

This repo provides my solutions for https://adventofcode.com/ 2020.

### How to use this repo:

The src/ directory contains a main file for each day.  Put your code there.  The build command `zig build dayXX [target and mode options] -- [program args]` will build and run the specified day.  You can also use `zig build install_dayXX [target and mode options]` to build the executable for a day and put it into `zig-cache/bin` without executing it.  By default this template does not link libc, but you can set `should_link_libc` to `true` in build.zig to change that.  If you have files with tests, add those files to the list of test files in build.zig.  The command `zig build test` will run tests in all of these files.
