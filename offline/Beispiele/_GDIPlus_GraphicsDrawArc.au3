#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $hGui, $hGraphic

	; Erstellt eine GUI
	$hGui = GUICreate("GDI+", 400, 300)
	GUISetState(@SW_SHOW)

	; Kreise zeichnen
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGui)
	_GDIPlus_GraphicsDrawArc($hGraphic, 160, 100, 10, 10, 180, 360)
	_GDIPlus_GraphicsDrawArc($hGraphic, 180, 100, 10, 10, 180, 360)
	_GDIPlus_GraphicsDrawArc($hGraphic, 160, 104, 30, 30, 160, -140)
	_GDIPlus_GraphicsDrawArc($hGraphic, 140, 80, 70, 70, 180, 360)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()
EndFunc   ;==>Example
