#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>

Local $hWnd = GUICreate("GDI+ Beispiel (" & @ScriptName & ")", 400, 300)
GUISetState(@SW_SHOW)

_GDIPlus_Startup()
Local $hGraphics = _GDIPlus_GraphicsCreateFromHWND($hWnd)
_GDIPlus_GraphicsClear($hGraphics)

Local $hBrush = _GDIPlus_BrushCreateSolid(0xFF009900)
Local $hFamily = _GDIPlus_FontFamilyCreate("Arial")
Local $hFont = _GDIPlus_FontCreate($hFamily, 32)
Local $hLayout = _GDIPlus_RectFCreate(0, 20, 400, 150)
Local $hStringFormat = _GDIPlus_StringFormatCreate()
_GDIPlus_StringFormatSetAlign($hStringFormat, 1) ; 0 - linksbündig, 1 - zentriert, 2 - rechtsbündig
; Zeichnet den String in das GUI-Fenster
_GDIPlus_GraphicsDrawStringEx($hGraphics, "AutoIt ist Spitze!", $hFont, $hLayout, $hStringFormat, $hBrush)

Local $iMsg = 0
Do
	$iMsg = GUIGetMsg()
Until $iMsg = $GUI_EVENT_CLOSE


_GDIPlus_BrushDispose($hBrush)
_GDIPlus_FontFamilyDispose($hFamily)
_GDIPlus_FontDispose($hFont)
_GDIPlus_StringFormatDispose($hStringFormat)
_GDIPlus_GraphicsDispose($hGraphics)
_GDIPlus_Shutdown()
