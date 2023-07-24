module doppler.page;
import doppler.poppler_page;
import doppler.poppler_common;

// import std.string : toStringz, fromStringz;

struct Page {
public:
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
