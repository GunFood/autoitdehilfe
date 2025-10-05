#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Ermittelt die Höhe / Breite (v" & @AutoItVersion & ")", 500, 300, 100, 100)

	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)
	Local $aParts[3] = [75, 150, -1]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	; Erstellt ein Memo Control
	_MemoCreate(2, 8, 444, 259)
	GUISetState(@SW_SHOW)

	; Ermittelt die Höhe/Breite der einzelnen Abschnitte
	_MemoWrite("Höhe der Abschnitte .: " & _GUICtrlStatusBar_GetHeight($hStatus))
	_MemoWrite("Breite von Abschnitt 0 .: " & _GUICtrlStatusBar_GetWidth($hStatus, 0))
	_MemoWrite("Breite von Abschnitt 1 .: " & _GUICtrlStatusBar_GetWidth($hStatus, 1))
	_MemoWrite("Breite von Abschnitt 2 .: " & _GUICtrlStatusBar_GetWidth($hStatus, 2))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example