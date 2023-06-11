#include <GDIPlus.au3>

Global $iWidth = 400, $iHeight = 400
Global $hWnd, $hGraphics, $hBitmap, $hBitmapContext, $hBrush_Yellow, $hBrush_Blue

$hWnd = GUICreate("GDI+ Bitmap Beispiel", 400, 400)
GUISetState()

_GDIPlus_Startup()

$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hWnd) ;Grafik für die GUI erzeugen
$hBitmap = _GDIPlus_BitmapCreateFromGraphics($iWidth, $iHeight, $hGraphics) ;Bitmap aus der Grafik erzeugen (Inhalt der Grafik wird nicht kopiert!)
$hBitmapContext = _GDIPlus_ImageGetGraphicsContext($hBitmap) ;Grafik für die Bitmap erzeugen, den Inhalt verändern zu können

$hBrush_Yellow = _GDIPlus_BrushCreateSolid(0xFFFFFF00) ;Gelbes Brush-Object erzeugen
$hBrush_Blue = _GDIPlus_BrushCreateSolid(0xFF0000FF) ;Blaues Brush-Object erzeugen

_GDIPlus_GraphicsClear($hBitmapContext, 0xFFFFFFFF) ;Gesamte Bitmap weiß färben
_GDIPlus_GraphicsFillRect($hBitmapContext, 50, 50, 200, 200, $hBrush_Blue) ;Zeichnet ein Blau ausgefülltes Rechteck auf die Bitmap (nicht die GUI!)
_GDIPlus_GraphicsFillEllipse($hBitmapContext, 150, 150, 200, 300, $hBrush_Yellow) ;Zeichnet eine gelbe Ellipse auf die Bitmap

_GDIPlus_GraphicsDrawImageRect($hGraphics, $hBitmap, 0, 0, $iWidth, $iHeight) ;Zeichnet die Bitmap mit ihrem Inhalt auf die GUI

;Ressourcen aufräumen!
_GDIPlus_GraphicsDispose($hGraphics)
_GDIPlus_GraphicsDispose($hBitmapContext)
_GDIPlus_BitmapDispose($hBitmap)
_GDIPlus_BrushDispose($hBrush_Yellow)
_GDIPlus_BrushDispose($hBrush_Blue)
_GDIPlus_Shutdown()

While GUIGetMsg() <> -3
WEnd