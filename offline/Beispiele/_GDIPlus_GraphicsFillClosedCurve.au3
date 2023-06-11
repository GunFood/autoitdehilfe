#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $hGui, $hGraphic, $aPoints[8][2]

	; Erstellt eine GUI
	$hGui = GUICreate("GDI+", 400, 300)
	GUISetState(@SW_SHOW)

	; Zeichnet und füllt eine geschlossene Spline
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGui)

	$aPoints[0][0] = 7
	$aPoints[1][0] = 50
	$aPoints[1][1] = 50
	$aPoints[2][0] = 100
	$aPoints[2][1] = 25
	$aPoints[3][0] = 200
	$aPoints[3][1] = 5
	$aPoints[4][0] = 250
	$aPoints[4][1] = 50
	$aPoints[5][0] = 300
	$aPoints[5][1] = 100
	$aPoints[6][0] = 350
	$aPoints[6][1] = 200
	$aPoints[7][0] = 250
	$aPoints[7][1] = 250

	_GDIPlus_GraphicsFillClosedCurve($hGraphic, $aPoints)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()
EndFunc   ;==>Example
