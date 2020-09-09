
## Writing

[Erick's notes on writing](https://github.com/matsengrp/wiki/wiki/writing_with_erick)


## Compilation

Type `scons --sconstruct SConstruct-noinkscape` in the command line if you don't have Inkscape all set up to work on the command line.
If you do, `scons` should work.
Use `scons continuous` to have continuous building after installing inotify.

If you have Inkscape v1.0 and do want to run Inkscape, use

    inkscape = Builder(action = 'inkscape --export-type=pdf --export-filename=$TARGET $SOURCE')
