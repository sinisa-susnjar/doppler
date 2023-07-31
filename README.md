# Doppler - D bindings for the poppler PDF rendering library

# Building

## Linux

### Prerequisites

## Windows

### Prerequisites

Install latest ldc2 from https://github.com/ldc-developers/ldc/releases (choose the windows-multilib.exe installer)

Install latest msys2 from https://www.msys2.org/#installation

Install msys2 package mingw-w64-x86_64-poppler using pacman

    pacman -S mingw-w64-x86_64-poppler

Download and install GTK 64 bit runtime from https://gtkd.org/

    set PATH=%PATH%;C:\msys64\mingw64\bin;C:\Program Files\Gtk-Runtime\bin

(order is important!)

### Open a windows command prompt and run

    dub build

then change directory into examples/pdfview and run

    dub build

Run the sample

    pdfview file:/Users/sini/src/doppler/example/pdfview/gtk3.pdf

## MacOS

### Prerequisites

### TODO
