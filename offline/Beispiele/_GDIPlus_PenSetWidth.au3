#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui, $hGraphic, $hPen

	; Erstellt eine GUI
	$hGui = GUICreate("GDI+", 400, 300)
	GUISetState(@SW_SHOW)

	; Zeichnet eine Linie
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGui)
	$hPen = _GDIPlus_PenCreate(0xFF000000, 8)
	_GDIPlus_PenSetWidth($hPen, 4)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 10, 390, 10, $hPen)

	; Die Breite des Zeichenstifts anzeigen
	MsgBox($MB_SYSTEMMODAL, "Information", "Breite des Zeichenstifts: " & _GDIPlus_PenGetWidth($hPen))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()
EndFunc   ;==>Example
