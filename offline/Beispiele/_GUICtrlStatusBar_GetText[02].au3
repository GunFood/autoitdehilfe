;== Beispiel 2 direkte Verwendung mit Icon-Datei

#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>

Beispiel()

Func Beispiel()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Setzt und ermittelt Text (v" & @AutoItVersion & ")", 450, 320, 100, 100)
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Erstellt ein Memo Control
	_MemoCreate(2, 8, 444, 259)
	GUISetState(@SW_SHOW)

	; Setzt die Abschnitte
	Local $aParts[4] = [75, 150, 300, 400]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 0")
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1", 1)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 2)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 3", 3)

	; Setzt die Icons
	_GUICtrlStatusBar_SetIcon($hStatus, 0, 23, "shell32.dll")
	_GUICtrlStatusBar_SetIcon($hStatus, 1, 40, "shell32.dll")

	; Zeigt den Text der Abschnitte
	_MemoWrite("Text von Abschnitt 0 ........: " & _GUICtrlStatusBar_GetText($hStatus, 0))
	_MemoWrite("Text von Abschnitt 1 ........: " & _GUICtrlStatusBar_GetText($hStatus, 1))

	; Zeigt die Handles der Icons
	_MemoWrite("Iconhandle Abschnitt 0 .: 0x" & Hex(_GUICtrlStatusBar_GetIcon($hStatus, 0)))
	_MemoWrite("Iconhandle Abschnitt 1 .: 0x" & Hex(_GUICtrlStatusBar_GetIcon($hStatus, 1)))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Beispiel