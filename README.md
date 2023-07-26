# Doppler - D bindings for the poppler PDF rendering library

# Building

## Linux

## Windows

### Prerequisites

Install latest ldc2 from https://github.com/ldc-developers/ldc/releases (choose the windows-multilib.exe installer)

Install latest msys2 from https://www.msys2.org/#installation

Install msys2 package mingw-w64-x86_64-poppler using pacman

Download and install GTK 64 bit runtime from https://gtkd.org/

set PATH=%PATH%;C:\msys64\mingw64\bin;C:\Program Files\Gtk-Runtime\bin REM (order is important!)

# choco install pkgconfiglite
# install msys2
# pacman -S --needed git base-devel mingw-w64-x86_64-toolchain mingw-w64-x86_64-cmake
# choco install poppler
# Install FreeType from https://gnuwin32.sourceforge.net/downlinks/freetype.php

Open a windows command prompt and run

    dub build

cd into examples/pdfview and run

    dub build

## MacOS
