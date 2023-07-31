import std.stdio;

import doppler.document;
import doppler.page;

import gtk.DrawingArea;
import gtk.MainWindow;
import gtk.Widget;
import gdk.Event;
import gtk.Main;
import gtk.Box;
import gdk.Keysyms;
import cairo.ImageSurface;
import cairo.Context;
import cairo.Surface;

void main(string[] args)
{
    if (args.length != 2) {
        writefln("usage: %s file:full-path-to-pdf\n", args[0]);
        return;
    }
    PdfViewWindow pdfViewWindow;
    Main.init(args);
    pdfViewWindow = new PdfViewWindow(args[1]);
    Main.run();
}   // main()

class PdfViewWindow : MainWindow {
    immutable string title = "Display PDF";
    AppBox appBox;

    this(string filename) {
        super(title);

        try {
            auto doc = Document.loadFromFile(filename);
            auto nPages = doc.getNPages();
            writefln("%s has %d pages", filename, nPages);
            if (nPages > 0) {
                auto page = doc.getPage(0);
                int width, height;
                page.getSize(width, height);
                setSizeRequest(width, height);
            }

            addOnDestroy(&quitApp);

            appBox = new AppBox(doc);
            add(appBox);

            showAll();
        } catch (Exception e) {
            writefln("caught exception: %s", e.msg);
            Main.quit();
        }
	}

	void quitApp(Widget widget) {
		writeln("Bye.");
		Main.quit();
	}
}   // PdfViewWindow

class AppBox : Box {
	MyDrawingArea myDrawingArea;

	this(Document doc) {
		super(Orientation.VERTICAL, 10);
		myDrawingArea = new MyDrawingArea(doc);
		packStart(myDrawingArea, true, true, 0);
	}
}   // AppBox

class MyDrawingArea : DrawingArea {
	immutable int xOffset = 0, yOffset = 0;
    Document document;
	Surface surface;
    int pageNo = 0;
    int nPages;
    Page page;

	this(Document doc) {
        document = doc;
        nPages = document.getNPages();
        page = document.getPage(pageNo);
        int width, height;
        page.getSize(width, height);
        surface = ImageSurface.create(CairoFormat.ARGB32, width, height);
		addOnDraw(&onDraw);

        setCanFocus(true);
        setEvents(EventMask.KEY_PRESS_MASK);
        addOnKeyPress((Event e, Widget widget) {
            uint keyVal;
            e.getKeyval(keyVal);
            final switch (keyVal) {
                case Keysyms.GDK_Escape:
                    writefln("Bye!");
                    Main.quit();
                    break;
                case Keysyms.GDK_Right:
                    if (pageNo < nPages-1) {
                        pageNo++;
                        page = document.getPage(pageNo);
                        queueDraw();
                    }
                    break;
                case Keysyms.GDK_Left:
                    if (pageNo > 0) {
                        pageNo--;
                        page = document.getPage(pageNo);
                        queueDraw();
                    }
                    break;
            }
            return true;
        });
	}

	bool onDraw(Scoped!Context context, Widget) {
        context.setSourceSurface(surface, xOffset, yOffset);
        page.render(context);
		context.paint();
		return true;
	}
}   // MyDrawingArea