#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>

; Erstellt eine GUI
Local $hWnd = GUICreate("GDI+Beispiel (" & @ScriptName & ")", 400, 300)
GUISetState(@SW_SHOW)

; Startet GDI+
_GDIPlus_Startup()
Local $hGraphics = _GDIPlus_GraphicsCreateFromHWND($hWnd)

Local $hMatrix = _GDIPlus_MatrixCreate()
; Verschiebt die Matrix halb in der Breite und halb in der Höhe zur Mitte
_GDIPlus_MatrixTranslate($hMatrix, 200, 150)
_GDIPlus_MatrixRotate($hMatrix, 45)
_GDIPlus_GraphicsSetTransform($hGraphics, $hMatrix)

Local $hPen = _GDIPlus_PenCreate(0xFF00FF00, 10)

_GDIPlus_GraphicsClear($hGraphics)
; Zeichnet um die linke Ecke der GUI. Jedoch erscheint das Objekt in der Mitte der GUI da die Matrix verschoben wurde
_GDIPlus_GraphicsDrawRect($hGraphics, -50, -50, 100, 100, $hPen)


Do
Until GUIGetMsg() = $GUI_EVENT_CLOSE

; Ressourcen freigeben
_GDIPlus_PenDispose($hPen)
_GDIPlus_MatrixDispose($hMatrix)
_GDIPlus_GraphicsDispose($hGraphics)
_GDIPlus_Shutdown()
