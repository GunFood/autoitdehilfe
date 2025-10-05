#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Ermittelt die Abschnitte (v" & @AutoItVersion & ")", 400, 300, 100, 100)
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Erstellt ein Memo Control
	_MemoCreate(2, 8, 444, 259)
	GUISetState(@SW_SHOW)

	; Setzt/Ermittelt die Abschnitte
	Local $aParts[3] = [75, 150, -1]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	; Ermittelt das Rechteck von Abschnitt 0
	Local $tRECT = _GUICtrlStatusBar_GetRectEx($hStatus, 0)
	_MemoWrite("Abschnitt 0 links ...: " & DllStructGetData($tRECT, "Left"))
	_MemoWrite("Abschnitt 0 oben ....: " & DllStructGetData($tRECT, "Top"))
	_MemoWrite("Abschnitt 0 rechts ..: " & DllStructGetData($tRECT, "Right"))
	_MemoWrite("Abschnitt 0 unten ...: " & DllStructGetData($tRECT, "Bottom"))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example