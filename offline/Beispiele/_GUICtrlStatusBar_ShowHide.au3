#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Zeigen und verstecken (v" & @AutoItVersion & ")", 450, 320, 100, 100)

	; Standard ist 1 Abschnitt und kein Text
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Erstellt ein Memo Control
	_MemoCreate(2, 8, 444, 259)
	GUISetState(@SW_SHOW)

	; Abschnitte setzen
	Local $aParts[3] = [75, 150, -1]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 0")
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1", 1)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 2)

	_GUICtrlStatusBar_ShowHide($hStatus, @SW_HIDE)
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Versteckt die StatusBar")
	_GUICtrlStatusBar_ShowHide($hStatus, @SW_HIDE)
	Sleep(2000)

	_GUICtrlStatusBar_ShowHide($hStatus, @SW_SHOW)
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Zeigt die StatusBar")
	_GUICtrlStatusBar_ShowHide($hStatus, @SW_SHOW)

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
