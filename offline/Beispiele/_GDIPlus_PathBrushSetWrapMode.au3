#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("GDI+", 600, 400)
	GUISetState(@SW_SHOW)

	_GDIPlus_Startup()
	Local $hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	_GDIPlus_GraphicsSetSmoothingMode($hGraphics, $GDIP_SMOOTHINGMODE_HIGHQUALITY)
	_GDIPlus_GraphicsClear($hGraphics, 0xFF000000)

	Local $aPoints[4][2] = [[3]]
	$aPoints[1][0] = 0
	$aPoints[1][1] = 0
	$aPoints[2][0] = 100
	$aPoints[2][1] = 30
	$aPoints[3][0] = 50
	$aPoints[3][1] = 80

	Local $hBrush = _GDIPlus_PathBrushCreate($aPoints, 3)
	_GDIPlus_PathBrushSetWrapMode($hBrush, 0)
	_GDIPlus_PathBrushSetCenterColor($hBrush, 0xFFFFFFFF)

	Local $aColors[4] = [3]
	$aColors[1] = 0xFFFF0000
	$aColors[2] = 0xFF00FF00
	$aColors[3] = 0xFF0000FF
	_GDIPlus_PathBrushSetSurroundColorsWithCount($hBrush, $aColors)

	_GDIPlus_GraphicsFillRect($hGraphics, 0, 0, 600, 400, $hBrush)


	Local $iWrapMode = _GDIPlus_PathBrushGetWrapMode($hBrush), $sWarpMode
	Switch $iWrapMode
		Case 0
			$sWarpMode = "Kacheln ohne spiegeln"
		Case 1
			$sWarpMode = "Kacheln werden horizontal gespiegelt, wenn Sie sich von einer Kachel zur nächsten in einer Reihe bewegen"
		Case 2
			$sWarpMode = "Kacheln werden vertikal gespiegelt, wenn Sie sich von einer Kachel zur nächsten in einer Spalte bewegen"
		Case 3
			$sWarpMode = "Kacheln werden horizontal gekippt, wenn Sie sich entlang einer Reihe bewegen und vertikal gedreht, während Sie sich entlang einer Spalte bewegen"
		Case 4
			$sWarpMode = "Es findet keine Veränderung statt"
	EndSwitch

	MsgBox($MB_SYSTEMMODAL, "", "Wrap mode: " & $sWarpMode)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_GraphicsDispose($hGraphics)
	_GDIPlus_Shutdown()
EndFunc   ;==>Example
