#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui, $hGraphic, $hPen, $hEndCap

	; Erzeugt die GUI
	$hGui = GUICreate("GDI+", 400, 300)
	GUISetState(@SW_SHOW)

	; Erzeugt die Ressourcen
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGui)
	$hPen = _GDIPlus_PenCreate(0xFF000000, 4)
	; Pfeilspitzenform festlegen
	$hEndCap = _GDIPlus_ArrowCapCreate(3, 6)
	; Dem Linienende unsere Pfeilspitzenform zuweisen
	_GDIPlus_PenSetCustomEndCap($hPen, $hEndCap)

	; Anzeige des Zeichenstift-Handles des Linienendes
	MsgBox($MB_SYSTEMMODAL, "Information", "Handle zum Zeichenstift des Linienendes: " & _GDIPlus_PenGetCustomEndCap($hPen))

	; Zeichnen der Linien, die aussehen wie Pfeile
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 120, 390, 120, $hPen)
	_GDIPlus_PenSetWidth($hPen, 4)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 150, 390, 150, $hPen)
	_GDIPlus_PenSetWidth($hPen, 6)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 180, 390, 180, $hPen)

	; Auf Schließen des GUI-Fensters durch den Benutzer warten
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()
EndFunc   ;==>Example
