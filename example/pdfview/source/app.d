import std.stdio;
import doppler.document;

import gtk.MainWindow;
import gtk.Main;
import gtk.Box;
import gtk.Widget;
import cairo.Context;
import cairo.ImageSurface;
import cairo.Surface;
import gtk.DrawingArea;

void main(string[] args)
{
    if (args.length != 2) {
        writefln("usage: %s file:full-path-to-pdf\n", args[0]);
        return;
    }
    string filename = args[1];
    try {
        auto doc = Document.loadFromFile(filename);
        auto nPages = doc.getNPages();
        writefln("%s has %d pages", filename, nPages);
        foreach (n; 0..nPages) {
            auto page = doc.getPage(n);
            int width, height;
            page.getSize(width, height);
            writefln("  #%d: w: %G h: %G", n, width, height);
            auto surface = ImageSurface.create(CairoFormat.ARGB32, width, height);
            auto context = Context.create(surface);
            context.paint();
        }
    } catch (Exception e) {
        writefln("caught exception: %s", e.msg);
    }
    auto surface = ImageSurface.createFromPng(filename);

	filename = "./foundlings.png";
    PdfViewWindow pdfViewWindow;
    Main.init(args);
    pdfViewWindow = new PdfViewWindow(filename);
    Main.run();
}   // main()

class PdfViewWindow : MainWindow {
	string title = "Display PNG";
	AppBox appBox;

	this(string filename) {
		super(title);

		setSizeRequest(970, 546);

		addOnDestroy(&quitApp);

		appBox = new AppBox(filename);
		add(appBox);

		showAll();
	}   // this()

	void quitApp(Widget widget) {
		writeln("Bye.");
		Main.quit();
	}   // quitApp()
}   // class PdfViewWindow

class AppBox : Box {
	MyDrawingArea myDrawingArea;

	this(string filename) {
		super(Orientation.VERTICAL, 10);
		myDrawingArea = new MyDrawingArea(filename);
		packStart(myDrawingArea, true, true, 0); // LEFT justify
	}   // this()
}   // class AppBox

class MyDrawingArea : DrawingArea {
	// string filename = "./foundlings.png";
	int xOffset = 0, yOffset = 0;
	Surface surface;

	this(string filename) {
		surface = ImageSurface.createFromPng(filename);
		addOnDraw(&onDraw);
	}   // this()

	bool onDraw(Scoped!Context context, Widget w) {
		context.setSourceSurface(surface, xOffset, yOffset);
		context.paint();
		return(true);
	}   // onDraw()
}   // class MyDrawingArea