#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("GDI+", 200, 180, -1, 50)
	GUISetState(@SW_SHOW)

	_GDIPlus_Startup()
	Local $hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	_GDIPlus_GraphicsSetSmoothingMode($hGraphics, $GDIP_SMOOTHINGMODE_HIGHQUALITY)
	_GDIPlus_GraphicsClear($hGraphics, 0xFF000000)

	Local $hPath = _GDIPlus_PathCreate()
	_GDIPlus_PathAddEllipse($hPath, 10, 10, 180, 160)

	Local $hBrush = _GDIPlus_PathBrushCreateFromPath($hPath)
	_GDIPlus_PathBrushSetFocusScales($hBrush, 0.25, 0.75)
	_GDIPlus_PathBrushSetCenterColor($hBrush, 0xFFFFFF00)
	_GDIPlus_PathBrushSetCenterPoint($hBrush, 90, 80)
	_GDIPlus_PathBrushSetSurroundColor($hBrush, 0xFF0000FF)
	_GDIPlus_PathBrushSetGammaCorrection($hBrush, True)
	_GDIPlus_GraphicsFillPath($hGraphics, $hPath, $hBrush)

	Local $aValue = _GDIPlus_PathBrushGetFocusScales($hBrush)
	MsgBox($MB_SYSTEMMODAL, "", "X Fokus Skalierung: " & $aValue[0] & @CRLF & "Y Fokus Skalierung: " & $aValue[1])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_PathDispose($hPath)
	_GDIPlus_GraphicsDispose($hGraphics)
	_GDIPlus_Shutdown()
EndFunc   ;==>Example
