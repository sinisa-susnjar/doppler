module doppler.page;
import doppler.poppler_page;
import doppler.poppler_common;

// import std.string : toStringz, fromStringz;

import cairo.ImageSurface;
import cairo.Surface;
import cairo.Context;

struct Page {
public:
    auto getSize() {
        import std.typecons : tuple;
        int width, height;
        getSize(width, height);
        return tuple!("width", "height")(width, height);
    }

    void getSize(out double width, out double height) {
        assert(m_page);
        poppler_page_get_size(m_page, &width, &height);
    }

    void getSize(out int width, out int height) {
        assert(m_page);
        double w, h;
        poppler_page_get_size(m_page, &w, &h);
        width = cast(int)(w + 0.5);
        height = cast(int)(h + 0.5);
    }

    void render(Context context) {
        poppler_page_render(m_page, context.getContextStruct());
    }

    void renderForPrinting(Context context) {
        poppler_page_render_for_printing(m_page, context.getContextStruct());
    }

    ImageSurface getImage(int imageId) {
        return new ImageSurface(poppler_page_get_image(m_page, imageId));
    }

    this(ref return scope Page rhs) {
        m_page = rhs.m_page;
        rhs.m_page = null;
    }

    ~this() {
        if (m_page) {
            import gtkc.gobject : g_object_unref;
            g_object_unref(m_page);
        }
    }

package:
    this(PopplerPage *page) {
        m_page = page;
    }
    PopplerPage *m_page;
}
