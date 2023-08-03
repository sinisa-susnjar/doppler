import std.stdio;

import doppler.document;

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
    Main.init(args);
    auto pdfViewWindow = new PdfViewWindow(args[1]);
    Main.run();
} // main()

class PdfViewWindow : MainWindow {
    this(string filename) {
        super("Display PDF Example");

        try {
            auto doc = Document.loadFromFile(filename);
            auto nPages = doc.getNPages();
            writefln("%s has %d pages", filename, nPages);
            assert(nPages > 0);
            addOnDestroy(&quitApp);
            add(new AppBox(doc));
            showAll();
        } catch (Exception e) {
            writefln("caught exception: %s", e.msg);
            Main.quit();
        }
    }

    void quitApp(Widget) {
        writeln("Bye.");
        Main.quit();
    }
} // PdfViewWindow

class AppBox : Box {
    this(Document doc) {
        super(Orientation.VERTICAL, 10);
        packStart(new MyDrawingArea(doc), true, true, 0);
    }
} // AppBox

class MyDrawingArea : DrawingArea {
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
        setSizeRequest(width, height);
        surface = ImageSurface.create(CairoFormat.ARGB32, width, height);
        addOnDraw(&onDraw);
        setCanFocus(true);
        setEvents(EventMask.KEY_PRESS_MASK);
        addOnKeyPress((Event e, Widget) {
            uint keyVal;
            e.getKeyval(keyVal);
            switch (keyVal) {
                case Keysyms.GDK_Escape:
                    writefln("Bye!");
                    Main.quit();
                    break;
                case Keysyms.GDK_Right:
                    if (pageNo < nPages-1) {
                        page = document.getPage(++pageNo);
                        queueDraw();
                    }
                    break;
                case Keysyms.GDK_Left:
                    if (pageNo > 0) {
                        page = document.getPage(--pageNo);
                        queueDraw();
                    }
                    break;
                default: // ignore
            }
            return true;
        });
    }

    bool onDraw(Scoped!Context context, Widget) {
        context.setSourceSurface(surface, 0, 0);
        page.render(context);
        context.paint();
        return true;
    }
} // MyDrawingArea