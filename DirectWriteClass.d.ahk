/** @extends {#Gui} */
class Gui {
   /**
    * Adds a Direct2D text control. The background is always transparent (the GUI's BackColor shows through).
    * Anything left blank is taken from the GUI's current font, or from a "cXXXXXX" in Options for the color.
    * @param {String} [Options=""] Same options as Gui.AddText (w, r, x, y, c, ...). A BackgroundXXXXXX option is ignored.
    * @param {String} [Text=""] Initial text.
    * @param {String} [Font=""] Font family. Blank = GUI's current font.
    * @param {Number|String} [Size=""] Size in points. Blank = GUI's current font size.
    * @param {Integer|String} [Fg=""] Text color, 0xRRGGBB or "RRGGBB". Blank = "cXXXXXX" in Options, else the system text color.
    * @param {Integer|String} [Weight=""] Font weight (400 = normal, 700 = bold). Blank = GUI's current font weight.
    * @param {Number} [Pad=0] Padding in DIPs (1/96 inch).
    * @returns {D2DText} The renderer. The control is available as .Ctrl, and the renderer as ctrl.D2D.
    */
   AddD2DText(Options?, Text?, Font?, Size?, Fg?, Weight?, Pad?) => D2DText

   /**
    * Adds a Direct2D grid: a table of text/emoji cells drawn into one control. Columns are aligned by DirectWrite
    * measurement instead of padding. Define the columns with SetColumns, fill it with SetRows.
    * The native control's height comes from Options (r<N> rows use the GUI font in effect, which should match Font/Size),
    * and the row pitch matches that same font. Take Font/Size/Weight from the GUI font when left blank.
    * @param {String} [Options=""] Same options as Gui.AddText (w, r, x, y, c, ...). Use r<rows> or call .Fit() after SetRows.
    * @param {String} [Text=""] Initial text of the native control only. The grid doesn't draw it (use SetRows).
    * @param {String} [Font=""] Font family. Blank = GUI's current font.
    * @param {Number|String} [Size=""] Size in points. Blank = GUI's current font size.
    * @param {Integer|String} [Fg=""] Default text color, 0xRRGGBB or "RRGGBB". Blank = "cXXXXXX" in Options, else the system text color.
    * @param {Integer|String} [Weight=""] Font weight (400 = normal, 700 = bold). Blank = GUI's current font weight.
    * @param {Number} [Pad=0] Padding in DIPs (1/96 inch).
    * @returns {D2DGrid} The grid. The control is available as .Ctrl, and the renderer as ctrl.D2D.
    */
   AddD2DGrid(Options?, Text?, Font?, Size?, Fg?, Weight?, Pad?) => D2DGrid
}

/** A table of text/emoji cells drawn with Direct2D/DirectWrite. Created with Gui.AddD2DGrid. */
class D2DGrid extends D2DText {
   /**
    * Defines the columns.
    * Each column is an object: {al: "Left"|"Right"|"Center", w: DIPs|"auto", gap: DIPs after this column}.
    * "auto" widths are measured from the cell text. gap defaults to SetGap (8).
    * @param {Array} cols Array of column objects.
    */
   SetColumns(cols) => void

   /**
    * Sets the rows and repaints. A row is an array of cells, one per column, and each cell is a string or an object:
    * {t: text, c: 0xRRGGBB, al: "Left"|"Right"|"Center", span: number of columns to cover}.
    * A spanning cell is aligned within the combined width and doesn't affect auto widths (use for headers).
    * @param {Array} rows Array of rows (arrays of cells).
    */
   SetRows(rows) => void

   /**
    * Sets the default gap after a column, for columns that don't have their own gap.
    * @param {Number} dips Gap in DIPs.
    */
   SetGap(dips) => void

   /** Sizes the control's height to the current row count. Assumes +DPIScale (GUI units are DIPs). */
   Fit() => void
}