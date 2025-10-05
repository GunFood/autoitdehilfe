#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>

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

	; Erstellt ein vollfarbiges Füllmuster
	$hBrush1 = _GDIPlus_BrushCreateSolid()

	; Fragt Farbe des vollfarbigen Füllmusters ab (Anm: Da keine Farbe angegeben wurde, ist diese schwarz)
	$iClr1 = _GDIPlus_BrushGetSolidColor($hBrush1)

	; Zeichnet ein paar Grafiken mit dem orginalen Füllmuster
	_GDIPlus_GraphicsFillEllipse($hGraphic, 25, 25, 100, 100, $hBrush1)

	; Setzt ein neues Füllmuster (0xFFFF0000 = Red)
	_GDIPlus_BrushSetSolidColor($hBrush1, 0xFFFF0000)

	; Fragt Farbe des neuen Füllmusters ab
	$iClr2 = _GDIPlus_BrushGetSolidColor($hBrush1)

	; Zeichnet ein paar Grafiken mit der neuen Füllmusterfarbe
	_GDIPlus_GraphicsFillRect($hGraphic, 220, 25, 100, 100, $hBrush1)

	; Schreibt die originale Füllmusterfarbe in Label1
	GUICtrlSetData($idLabel1, "Füllmuster orignale Farbe: " & Hex($iClr1))

	; Schreibt die neue Füllmusterfarbe in Label2
	GUICtrlSetData($idLabel2, "Füllmuster neue Farbe: " & Hex($iClr2))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion des GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_BrushDispose($hBrush1)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()
EndFunc   ;==>Example
