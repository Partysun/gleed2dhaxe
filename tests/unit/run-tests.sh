#!/bin/sh -e
#
# Builds and runs the unit tests

mkdir -p build
#haxe -neko build/tests.n -dce full -debug -cp src -cp ../../../gleed2dhaxe -lib openfl -lib random --remap flash:openfl -main TestMain
haxe build.hxml
neko build/tests.n
