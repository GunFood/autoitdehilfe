#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>

_Main()

Func _Main()
	Local $hGUI, $hGraphic, $hPen

	; Erstellt eine GUI
	$hGUI = GUICreate("GDI+", 400, 300)
	GUISetState()

	; Zeichnet eine Linie
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	$hPen = _GDIPlus_PenCreate()

	;1. Kreis
	ConsoleWrite("Stiftfarbe" & @TAB & _GDIPlus_PenGetColor($hPen) & @CRLF)
	_GDIPlus_GraphicsDrawArc($hGraphic, 10, 10, 70, 70, 180, 360, $hPen)

	;2. Kreis
	_GDIPlus_PenSetColor($hPen, 0xFFFFFF00)
	ConsoleWrite("Stiftfarbe" & @TAB & _GDIPlus_PenGetColor($hPen) & @CRLF)
	_GDIPlus_GraphicsDrawArc($hGraphic, 200, 200, 70, 70, 180, 360, $hPen)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()
EndFunc   ;==>_Main

