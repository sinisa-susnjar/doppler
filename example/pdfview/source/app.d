import std.stdio;

import doppler.document;

void main(string[] args)
{
    string filename;
    if (args.length == 2) {
        writefln("arg: %s", args[1]);
        filename = args[1];
    } else {
        writefln("usage: %s file:full-path-to-pdf\n", args[0]);
        return;
    }

    try {
        auto doc = Document.loadFromFile(filename);
        writefln("%s has %d pages", filename, doc.getNPages());
    } catch (Exception e) {
        writefln("caught exception: %s", e.msg);
    }
}