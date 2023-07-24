module doppler.document;
import doppler.poppler_document;
import doppler.poppler_common;

import doppler.page;
import std.string : toStringz, fromStringz;

struct Document {
public:
    static Document loadFromFile(const string fileName,
                                const string password = "")
    {
        immutable (char) *pw = null;
        import gtkc.glib : g_error_free;
        GError *err = null;
        if (password.length)
            pw = toStringz(password);
        auto doc = poppler_document_new_from_file(toStringz(fileName), pw, &err);
        if (err !is null) {
            string msg = cast(string)fromStringz(err.message).dup;
            // int code = err.code;
            g_error_free(err);
            throw new Exception(msg);
        }
        return Document(doc);
    }

    int getNPages() {
        assert(m_doc);
        return poppler_document_get_n_pages(m_doc);
    }

    Page getPage(int index) {
        assert(m_doc);
        return Page(poppler_document_get_page(m_doc, index));
    }

    this(ref return scope Document rhs) {
        m_doc = rhs.m_doc;
        rhs.m_doc = null;
    }

    ~this() {
        if (m_doc) {
            import gtkc.gobject : g_object_unref;
            g_object_unref(m_doc);
        }
    }

private:
    this(PopplerDocument *doc) {
        m_doc = doc;
    }
    PopplerDocument *m_doc;
}
