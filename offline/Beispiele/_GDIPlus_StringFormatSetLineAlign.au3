#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $hWnd = GUICreate("GDI+ Beispiel (" & @ScriptName & ")", 400, 300)
	GUISetState(@SW_SHOW)

	_GDIPlus_Startup()
	Local $hGraphics = _GDIPlus_GraphicsCreateFromHWND($hWnd)
	_GDIPlus_GraphicsClear($hGraphics)

	Local $hBrush = _GDIPlus_BrushCreateSolid(0xFF009900)
	Local $hFamily = _GDIPlus_FontFamilyCreate("Arial")
	Local $hFont = _GDIPlus_FontCreate($hFamily, 36)
	Local $hLayout = _GDIPlus_RectFCreate(0, 0, 400, 300)
	Local $hStringFormat = _GDIPlus_StringFormatCreate()
	_GDIPlus_StringFormatSetAlign($hStringFormat, 1)
	_GDIPlus_StringFormatSetLineAlign($hStringFormat, 1)
	_GDIPlus_GraphicsDrawStringEx($hGraphics, "AutoIt Rocks", $hFont, $hLayout, $hStringFormat, $hBrush)

	Do
		Local $iMsg = GUIGetMsg()
	Until $iMsg = $GUI_EVENT_CLOSE

	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_FontFamilyDispose($hFamily)
	_GDIPlus_FontDispose($hFont)
	_GDIPlus_StringFormatDispose($hStringFormat)
	_GDIPlus_GraphicsDispose($hGraphics)
	_GDIPlus_Shutdown()
EndFunc   ;==>Example
