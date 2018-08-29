#include <GDIPlus.au3>

Global $iWidth = 400, $iHeight = 400
Global $hWnd, $hGraphics

$hWnd = GUICreate("GDI+ Smoothing Beispiel", 400, 400)
GUISetState()

_GDIPlus_Startup()

$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hWnd) ;Grafik für die GUI erzeugen

;- Ohne Kantenglättung:
_GDIPlus_GraphicsSetSmoothingMode($hGraphics, 0)
_GDIPlus_GraphicsFillEllipse($hGraphics, 20, 100, 160, 200) ;Zeichnet eine schwarze Ellipse auf die GUI [links]
ConsoleWrite("Aktueller Kantenglättungsmodus: " & _GDIPlus_GraphicsGetSmoothingMode($hGraphics) & @CRLF)

;- Mit Kantenglättung:
_GDIPlus_GraphicsSetSmoothingMode($hGraphics, 2)
_GDIPlus_GraphicsFillEllipse($hGraphics, 220, 100, 160, 200) ;[rechts]
ConsoleWrite("Aktueller Kantenglättungsmodus: " & _GDIPlus_GraphicsGetSmoothingMode($hGraphics) & @CRLF)

;Ressourcen aufräumen!
_GDIPlus_GraphicsDispose($hGraphics)
_GDIPlus_Shutdown()

While GUIGetMsg() <> -3
WEnd