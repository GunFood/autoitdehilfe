#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WinAPIIcons.au3>

Example()

Func Example()
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
	Local $iWrongSetText = _GUICtrlStatusBar_SetText($hStatus, "Falscher Abschnitt", 4)

	; Setzt die Icons
	Local $ahIcons[2]
	$ahIcons[0] = _WinAPI_LoadShell32Icon(23)
	$ahIcons[1] = _WinAPI_LoadShell32Icon(40)
	_GUICtrlStatusBar_SetIcon($hStatus, 0, $ahIcons[0])
	_GUICtrlStatusBar_SetIcon($hStatus, 1, $ahIcons[1])

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
	; Icons löschen
	_WinAPI_DestroyIcon($ahIcons[0])
	_WinAPI_DestroyIcon($ahIcons[1])
	GUIDelete()
EndFunc   ;==>Example
