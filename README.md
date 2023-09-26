# Doppler - D bindings for the Poppler PDF rendering library

This library provides a D wrapper around the Poppler PDF rendering library (poppler-23.07.0).
The current functionality is limited to displaying PDF documents loaded from a file.

No actual PDF generating abilities have been wrapped yet, but I am happy to add them here if requested.

The current functionality encloses:

* Document

  static Document loadFromFile(string fileName, string password = "");

  int getNPages();

  Page getPage(int index);

* Page

  void getSize(out double width, out double height);

  void render(Context context);

  void renderForPrinting(Context context);

  ImageSurface getImage(int imageId);

# Building

## Linux

    sudo apt install libpoppler-glib8

### Prerequisites

Install Poppler glib package, Ubuntu 22.04 example (ymmv):

    sudo apt install libpoppler-glib8

### Open a terminal and run

    dub build

then change directory into examples/pdfview and run

    dub build

Run the sample

    ./pdfview file:$PWD/gtk3.pdf

## Windows

### Prerequisites

Install latest msys2 from https://www.msys2.org/#installation

Install msys2 package mingw-w64-x86_64-poppler using pacman

    pacman -S mingw-w64-x86_64-poppler

Download and install GTK 64 bit runtime from https://gtkd.org/

    set PATH=%PATH%;C:\msys64\mingw64\bin;C:\Program Files\Gtk-Runtime\bin

(order of the path is important!)

### Open a windows command prompt and run

    dub build

then change directory into examples/pdfview and run

    dub build

Run the sample

    pdfview.exe file:/Users/myuser/src/doppler/example/pdfview/gtk3.pdf

## MacOS

**TODO**

Does anyone have a Macbook and wants to help out?

### Prerequisites

### TODO

A lot!

# Releases

v0.0.1 first release
