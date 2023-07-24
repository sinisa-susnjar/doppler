module doppler.poppler_page;
import doppler.poppler_common;

extern (C) {

/* poppler-page.h: glib interface to poppler
 * Copyright (C) 2004, Red Hat, Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.
 */

// #ifndef __POPPLER_PAGE_H__
// #define __POPPLER_PAGE_H__

// #include <glib-object.h>

// #include "poppler.h"

// #include <cairo.h>

// G_BEGIN_DECLS

// #define POPPLER_TYPE_PAGE (poppler_page_get_type())
// #define POPPLER_PAGE(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), POPPLER_TYPE_PAGE, PopplerPage))
// #define POPPLER_IS_PAGE(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), POPPLER_TYPE_PAGE))

// POPPLER_PUBLIC
@safe @nogc GType poppler_page_get_type() pure nothrow;

struct PopplerFormField;
struct PopplerAction;
struct PopplerAnnot;
struct cairo_surface_t;
struct cairo_region_t;
struct cairo_t;

// POPPLER_PUBLIC
@safe @nogc void poppler_page_render(PopplerPage *page, cairo_t *cairo) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_page_render_for_printing(PopplerPage *page, cairo_t *cairo) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_page_render_for_printing_with_options(PopplerPage *page, cairo_t *cairo, PopplerPrintFlags options) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc cairo_surface_t *poppler_page_get_thumbnail(PopplerPage *page) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_page_render_selection(PopplerPage *page, cairo_t *cairo, PopplerRectangle *selection, PopplerRectangle *old_selection, PopplerSelectionStyle style, PopplerColor *glyph_color, PopplerColor *background_color) pure nothrow;

// POPPLER_PUBLIC
@safe @nogc void poppler_page_get_size(PopplerPage *page, double *width, double *height) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc int poppler_page_get_index(PopplerPage *page) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc gchar *poppler_page_get_label(PopplerPage *page) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc double poppler_page_get_duration(PopplerPage *page) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerPageTransition *poppler_page_get_transition(PopplerPage *page) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc gboolean poppler_page_get_thumbnail_size(PopplerPage *page, int *width, int *height) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc GList *poppler_page_find_text_with_options(PopplerPage *page, const char *text, PopplerFindFlags options) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc GList *poppler_page_find_text(PopplerPage *page, const char *text) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_page_render_to_ps(PopplerPage *page, PopplerPSFile *ps_file) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc char *poppler_page_get_text(PopplerPage *page) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc char *poppler_page_get_text_for_area(PopplerPage *page, PopplerRectangle *area) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc char *poppler_page_get_selected_text(PopplerPage *page, PopplerSelectionStyle style, PopplerRectangle *selection) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc cairo_region_t *poppler_page_get_selected_region(PopplerPage *page, gdouble scale, PopplerSelectionStyle style, PopplerRectangle *selection) pure nothrow;
// POPPLER_PUBLIC
// G_GNUC_DEPRECATED_FOR(poppler_page_get_selected_region);
@safe @nogc GList *poppler_page_get_selection_region(PopplerPage *page, gdouble scale, PopplerSelectionStyle style, PopplerRectangle *selection) pure nothrow;
// POPPLER_PUBLIC
// G_GNUC_DEPRECATED_FOR(cairo_region_destroy);
@safe @nogc void poppler_page_selection_region_free(GList *region) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc GList *poppler_page_get_link_mapping(PopplerPage *page) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_page_free_link_mapping(GList *list) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc GList *poppler_page_get_image_mapping(PopplerPage *page) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_page_free_image_mapping(GList *list) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc cairo_surface_t *poppler_page_get_image(PopplerPage *page, gint image_id) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc GList *poppler_page_get_form_field_mapping(PopplerPage *page) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_page_free_form_field_mapping(GList *list) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc GList *poppler_page_get_annot_mapping(PopplerPage *page) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_page_free_annot_mapping(GList *list) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_page_add_annot(PopplerPage *page, PopplerAnnot *annot) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_page_remove_annot(PopplerPage *page, PopplerAnnot *annot) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_page_get_crop_box(PopplerPage *page, PopplerRectangle *rect) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc gboolean poppler_page_get_bounding_box(PopplerPage *page, PopplerRectangle *rect) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc gboolean poppler_page_get_text_layout(PopplerPage *page, PopplerRectangle **rectangles, guint *n_rectangles) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc gboolean poppler_page_get_text_layout_for_area(PopplerPage *page, PopplerRectangle *area, PopplerRectangle **rectangles, guint *n_rectangles) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc GList *poppler_page_get_text_attributes(PopplerPage *page) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_page_free_text_attributes(GList *list) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc GList *poppler_page_get_text_attributes_for_area(PopplerPage *page, PopplerRectangle *area) pure nothrow;

/* A rectangle on a page, with coordinates in PDF points. */
// #define POPPLER_TYPE_RECTANGLE (poppler_rectangle_get_type())
/**
 * PopplerRectangle:
 * @x1: x coordinate of lower left corner
 * @y1: y coordinate of lower left corner
 * @x2: x coordinate of upper right corner
 * @y2: y coordinate of upper right corner
 *
 * A #PopplerRectangle is used to describe
 * locations on a page and bounding boxes
 */
struct PopplerRectangle
{
    gdouble x1;
    gdouble y1;
    gdouble x2;
    gdouble y2;
}

// POPPLER_PUBLIC
@safe @nogc GType poppler_rectangle_get_type() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerRectangle *poppler_rectangle_new() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerRectangle *poppler_rectangle_copy(PopplerRectangle *rectangle) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_rectangle_free(PopplerRectangle *rectangle) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc gboolean poppler_rectangle_find_get_match_continued(const PopplerRectangle *rectangle) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc gboolean poppler_rectangle_find_get_ignored_hyphen(const PopplerRectangle *rectangle) pure nothrow;

/* A point on a page, with coordinates in PDF points. */
// #define POPPLER_TYPE_POINT (poppler_point_get_type())
/**
 * PopplerPoint:
 * @x: x coordinate
 * @y: y coordinate
 *
 * A #PopplerPoint is used to describe a location point on a page
 */
struct PopplerPoint
{
    gdouble x;
    gdouble y;
};

// POPPLER_PUBLIC
@safe @nogc GType poppler_point_get_type() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerPoint *poppler_point_new() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerPoint *poppler_point_copy(PopplerPoint *point) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_point_free(PopplerPoint *point) pure nothrow;

/* PopplerQuadrilateral */

/* A quadrilateral encompasses a word or group of contiguous words in the
 * text underlying the annotation. The coordinates for each quadrilateral are
 * given in the order x1 y1 x2 y2 x3 y3 x4 y4 specifying the quadrilateral’s four
 *  vertices in counterclockwise order */

// #define POPPLER_TYPE_QUADRILATERAL (poppler_quadrilateral_get_type())
/**
 *  PopplerQuadrilateral:
 *  @p1: a #PopplerPoint with the first vertex coordinates
 *  @p2: a #PopplerPoint with the second vertex coordinates
 *  @p3: a #PopplerPoint with the third vertex coordinates
 *  @p4: a #PopplerPoint with the fourth vertex coordinates
 *
 *  A #PopplerQuadrilateral is used to describe rectangle-like polygon
 *  with arbitrary inclination on a page.
 *
 *  Since: 0.26
 **/
struct PopplerQuadrilateral
{
    PopplerPoint p1;
    PopplerPoint p2;
    PopplerPoint p3;
    PopplerPoint p4;
};

// POPPLER_PUBLIC
@safe @nogc GType poppler_quadrilateral_get_type() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerQuadrilateral *poppler_quadrilateral_new() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerQuadrilateral *poppler_quadrilateral_copy(PopplerQuadrilateral *quad) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_quadrilateral_free(PopplerQuadrilateral *quad) pure nothrow;

/* A color in RGB */
// #define POPPLER_TYPE_COLOR (poppler_color_get_type())

/**
 * PopplerColor:
 * @red: the red component of color
 * @green: the green component of color
 * @blue: the blue component of color
 *
 * A #PopplerColor describes a RGB color. Color components
 * are values between 0 and 65535
 */
struct PopplerColor
{
    guint16 red;
    guint16 green;
    guint16 blue;
};

// POPPLER_PUBLIC
@safe @nogc GType poppler_color_get_type() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerColor *poppler_color_new() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerColor *poppler_color_copy(PopplerColor *color) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_color_free(PopplerColor *color) pure nothrow;

/* Text attributes. */
// #define POPPLER_TYPE_TEXT_ATTRIBUTES (poppler_text_attributes_get_type())
/**
 * PopplerTextAttributes:
 * @font_name: font name
 * @font_size: font size
 * @is_underlined: if text is underlined
 * @color: a #PopplerColor, the foreground color
 * @start_index: start position this text attributes apply
 * @end_index: end position this text attributes apply
 *
 * A #PopplerTextAttributes is used to describe text attributes of a range of text
 *
 * Since: 0.18
 */
struct PopplerTextAttributes
{
    gchar *font_name;
    gdouble font_size;
    gboolean is_underlined;
    PopplerColor color;

    gint start_index;
    gint end_index;
};

// POPPLER_PUBLIC
@safe @nogc GType poppler_text_attributes_get_type() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerTextAttributes *poppler_text_attributes_new() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerTextAttributes *poppler_text_attributes_copy(PopplerTextAttributes *text_attrs) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_text_attributes_free(PopplerTextAttributes *text_attrs) pure nothrow;

/* Mapping between areas on the current page and PopplerActions */
// #define POPPLER_TYPE_LINK_MAPPING (poppler_link_mapping_get_type())

/**
 * PopplerLinkMapping:
 * @area: a #PopplerRectangle representing an area of the page
 * @action: a #PopplerAction
 *
 * A #PopplerLinkMapping structure represents the location
 * of @action on the page
 */
struct PopplerLinkMapping
{
    PopplerRectangle area;
    PopplerAction *action;
};

// POPPLER_PUBLIC
@safe @nogc GType poppler_link_mapping_get_type() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerLinkMapping *poppler_link_mapping_new() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerLinkMapping *poppler_link_mapping_copy(PopplerLinkMapping *mapping) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_link_mapping_free(PopplerLinkMapping *mapping) pure nothrow;

/* Page Transition */
// #define POPPLER_TYPE_PAGE_TRANSITION (poppler_page_transition_get_type())

/**
 * PopplerPageTransition:
 * @type: the type of transtition
 * @alignment: the dimension in which the transition effect shall occur.
 * Only for #POPPLER_PAGE_TRANSITION_SPLIT and #POPPLER_PAGE_TRANSITION_BLINDS transition types
 * @direction: the direction of motion for the transition effect.
 * Only for #POPPLER_PAGE_TRANSITION_SPLIT, #POPPLER_PAGE_TRANSITION_BOX and #POPPLER_PAGE_TRANSITION_FLY
 * transition types
 * @duration: the duration of the transition effect
 * @angle: the direction in which the specified transition effect shall moves,
 * expressed in degrees counterclockwise starting from a left-to-right direction.
 * Only for #POPPLER_PAGE_TRANSITION_WIPE, #POPPLER_PAGE_TRANSITION_GLITTER, #POPPLER_PAGE_TRANSITION_FLY,
 * #POPPLER_PAGE_TRANSITION_COVER, #POPPLER_PAGE_TRANSITION_UNCOVER and #POPPLER_PAGE_TRANSITION_PUSH
 * transition types
 * @scale: the starting or ending scale at which the changes shall be drawn.
 * Only for #POPPLER_PAGE_TRANSITION_FLY transition type
 * @rectangular: whether the area that will be flown is rectangular and opaque.
 * Only for #POPPLER_PAGE_TRANSITION_FLY transition type
 *
 * A #PopplerPageTransition structures describes a visual transition
 * to use when moving between pages during a presentation
 */
struct PopplerPageTransition
{
    PopplerPageTransitionType type;
    PopplerPageTransitionAlignment alignment;
    PopplerPageTransitionDirection direction;
    gint duration;
    gint angle;
    gdouble scale;
    gboolean rectangular;
    gdouble duration_real;
};

// POPPLER_PUBLIC
@safe @nogc GType poppler_page_transition_get_type() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerPageTransition *poppler_page_transition_new() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerPageTransition *poppler_page_transition_copy(PopplerPageTransition *transition) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_page_transition_free(PopplerPageTransition *transition) pure nothrow;

/* Mapping between areas on the current page and images */
// #define POPPLER_TYPE_IMAGE_MAPPING (poppler_image_mapping_get_type())

/**
 * PopplerImageMapping:
 * @area: a #PopplerRectangle representing an area of the page
 * @image_id: an image identifier
 *
 * A #PopplerImageMapping structure represents the location
 * of an image on the page
 */
struct PopplerImageMapping
{
    PopplerRectangle area;
    gint image_id;
};

// POPPLER_PUBLIC
@safe @nogc GType poppler_image_mapping_get_type() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerImageMapping *poppler_image_mapping_new() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerImageMapping *poppler_image_mapping_copy(PopplerImageMapping *mapping) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_image_mapping_free(PopplerImageMapping *mapping) pure nothrow;

/* Mapping between areas on the current page and form fields */
// #define POPPLER_TYPE_FORM_FIELD_MAPPING (poppler_form_field_mapping_get_type())

/**
 * PopplerFormFieldMapping:
 * @area: a #PopplerRectangle representing an area of the page
 * @field: a #PopplerFormField
 *
 * A #PopplerFormFieldMapping structure represents the location
 * of @field on the page
 */
struct PopplerFormFieldMapping
{
    PopplerRectangle area;
    PopplerFormField *field;
};

// POPPLER_PUBLIC
@safe @nogc GType poppler_form_field_mapping_get_type() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerFormFieldMapping *poppler_form_field_mapping_new() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerFormFieldMapping *poppler_form_field_mapping_copy(PopplerFormFieldMapping *mapping) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_form_field_mapping_free(PopplerFormFieldMapping *mapping) pure nothrow;

/* Mapping between areas on the current page and annots */
// #define POPPLER_TYPE_ANNOT_MAPPING (poppler_annot_mapping_get_type())

/**
 * PopplerAnnotMapping:
 * @area: a #PopplerRectangle representing an area of the page
 * @annot: a #PopplerAnnot
 *
 * A #PopplerAnnotMapping structure represents the location
 * of @annot on the page
 */
struct PopplerAnnotMapping
{
    PopplerRectangle area;
    PopplerAnnot *annot;
};

// POPPLER_PUBLIC
@safe @nogc GType poppler_annot_mapping_get_type() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerAnnotMapping *poppler_annot_mapping_new() pure nothrow;
// POPPLER_PUBLIC
@safe @nogc PopplerAnnotMapping *poppler_annot_mapping_copy(PopplerAnnotMapping *mapping) pure nothrow;
// POPPLER_PUBLIC
@safe @nogc void poppler_annot_mapping_free(PopplerAnnotMapping *mapping) pure nothrow;

// G_END_DECLS

// #endif /* __POPPLER_PAGE_H__ */

}
