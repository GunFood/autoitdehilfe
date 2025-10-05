#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Ränder ermitteln (v" & @AutoItVersion & ")", 400, 300, 100, 100)

	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)
	Local $aParts[3] = [75, 150, -1]

	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	; Erstellt ein Memo Control
	_MemoCreate(2, 8, 444, 259)
	GUISetState(@SW_SHOW)

	; Ermittelt die aktuelle Breite des horizontalen und vertikalen Randes
	_MemoWrite("Breite des horizontalen Randes ...........: " & _GUICtrlStatusBar_GetBordersHorz($hStatus))
	_MemoWrite("Breite des vertikalen Randes .............: " & _GUICtrlStatusBar_GetBordersVert($hStatus))
	_MemoWrite("Breite des Randes zwischen den Rechtecken : " & _GUICtrlStatusBar_GetBordersRect($hStatus))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example