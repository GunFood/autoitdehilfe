#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGui, $idLabel1, $idLabel2, $hGraphic, $hBrush1, $iClr1, $iClr2

	; Erstellt ein GUI
	$hGui = GUICreate("GDI+", 345, 150)
	$idLabel1 = GUICtrlCreateLabel("", 2, 2, 150, 20)
	$idLabel2 = GUICtrlCreateLabel("", 202, 2, 150, 20)
	GUISetState(@SW_SHOW)
	Sleep(100)

	; Startet GDIPlus
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGui)

	; Erstellt ein einfarbiges Füllmuster
	$hBrush1 = _GDIPlus_BrushCreateSolid()

	; Originale Farbe des einfarbigen Füllmusters abfragen
	$iClr1 = _GDIPlus_BrushGetSolidColor($hBrush1)

	; Einige Grafiken mit der originalen Farbe des Füllmusters zeichnen
	_GDIPlus_GraphicsFillEllipse($hGraphic, 25, 35, 100, 100, $hBrush1)

	; Neue Füllmusterfarbe festlegen (0xFFFF0000 = Red)
	_GDIPlus_BrushSetSolidColor($hBrush1, 0xFFFF0000)

	; Neue Farbe des Füllmusters abfragen
	$iClr2 = _GDIPlus_BrushGetSolidColor($hBrush1)

	; Einige Grafiken mit der neuen Farbe des Füllmusters zeichnen
	_GDIPlus_GraphicsFillRect($hGraphic, 220, 35, 100, 100, $hBrush1)

	; Originale Füllmusterfarbe in Label1 schreiben
	GUICtrlSetData($idLabel1, "Füllmuster orignale Farbe: " & Hex($iClr1))

	; Neue Füllmusterfarbe in Label2 schreiben
	GUICtrlSetData($idLabel2, "Füllmuster neue Farbe: " & Hex($iClr2))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion des GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_BrushDispose($hBrush1)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()
EndFunc   ;==>Example
