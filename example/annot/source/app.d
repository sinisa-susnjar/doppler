import doppler.poppler_common;
import doppler.poppler_page;
import doppler.poppler_document;
import doppler.poppler_annot;

import gtkc.glib : g_error_free, g_printerr;
import gtkc.gobject : g_object_unref;
import gdk.Gdk : GdkRGBA;

import std.path : dirName, buildNormalizedPath;
import std.file : getcwd;
import std.format : format;
import std.string : toStringz;

import std.stdio;

void add_text_annotation(string input_pdf, string output_pdf, int page_num)
{
  GError* error = null;

  // 1. Load the document
  auto doc = poppler_document_new_from_file(toStringz(input_pdf), null, &error);
  if (error) {
    g_printerr("Error loading PDF: %s\n", error.message);
    g_error_free(error);
    return;
  }

  // 2. Get the page
  auto page = poppler_document_get_page(doc, page_num - 1);
  if (!page) {
    g_printerr("Page not found\n");
    g_object_unref(doc);
    return;
  }

  // 3. Create a new text annotation
  PopplerRectangle rect = {100, 100, 150, 150}; // x1, y1, x2, y2 (position)
  auto annot = poppler_annot_text_new(doc, &rect);

  // 4. Configure the annotation
  poppler_annot_set_rectangle(annot, &rect);

  // Set the annotation text
  poppler_annot_set_contents(annot, "This is a text annotation!");

  // Make it a "sticky note" (open by default)
  poppler_annot_text_set_is_open(cast(PopplerAnnotText*) annot, true);

  // Set color (yellow for sticky notes)
  PopplerColor color = {255, 255, 0};
  poppler_annot_set_color(annot, &color);

  // 5. Add the annotation to the page
  poppler_page_add_annot(page, annot);

  // 6. Save the modified document
  poppler_document_save(doc, toStringz(output_pdf), &error);
  if (error) {
    g_printerr("Error saving PDF: %s\n", error.message);
    g_error_free(error);
    return;
  }

  // Cleanup
  g_object_unref(annot);
  g_object_unref(page);
  g_object_unref(doc);
}

void main(string[] args)
{
  string path;
  if (args[0][0] == '.')
    path = buildNormalizedPath(getcwd(), dirName(args[0]));
  else
    path = buildNormalizedPath(dirName(args[0]));
  auto input = format("file:%s/input.pdf", path);
  auto output = format("file:%s/output.pdf", path);
  add_text_annotation(input, output, 1); // Add to page 1
}
