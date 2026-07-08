#!/bin/zsh

git clone https://github.com/alexkdeveloper/desktop-files-creator
cd desktop-files-creator

meson setup builddir --prefix/usr
meson compile -C builddir

