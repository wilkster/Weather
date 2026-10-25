
/** @extends {#Gui} */
class Gui {
   /**
    * Adds a Direct2D text control.
    * @param {Gui} g The GUI that owns the control.
    * @param {String} [options=""] Same options as Gui.AddText (w, r, x, y, c, BackgroundXXXXXX ...).
    * @param {String} [text=""] Initial text.
    * @param {String} [font=""] Font family. Blank = GUI's current font.
    * @param {Number|String} [size=""] Size in points. Blank = GUI's current font size.
    * @param {Integer|String} [fg=""] Text color, 0xRRGGBB. Blank = see above.
    * @param {Integer|String} [bg=""] Background color, 0xRRGGBB. Blank = see above.
    * @param {Integer} [weight=400] Font weight (400 = normal, 700 = bold).
    * @param {Number} [pad=0] Padding in DIPs (1/96 inch).
    * @returns {D2DText} The renderer. The control is available as .Ctrl, and the renderer as ctrl.D2D.
    */
   AddD2DText(Options?, Text?, Font?, Size?, Fg?, Bg?, Weight?) => D2DText
}