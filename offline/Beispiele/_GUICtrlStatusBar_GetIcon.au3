; == Beispiel 1 Verwendung des Iconhandles

#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WinAPIIcons.au3>

Example1()

Func Example1()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Setzt und ermittelt das Icon (v" & @AutoItVersion & ")", 500, 300, 100, 100)
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Erstellt ein Memo Control
	_MemoCreate(2, 8, 444, 259)
	GUISetState(@SW_SHOW)

	; Abschnitte setzen
	Local $aParts[4] = [75, 150, 300, 400]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1")
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 1)

	; Setzt die Icons
	Local $ahIcons[2]
	$ahIcons[0] = _WinAPI_LoadShell32Icon(23)
	$ahIcons[1] = _WinAPI_LoadShell32Icon(40)
	_GUICtrlStatusBar_SetIcon($hStatus, 0, $ahIcons[0])
	_GUICtrlStatusBar_SetIcon($hStatus, 1, $ahIcons[1])

	; Zeigt die Handles der Icons
	_MemoWrite("Handle vom Icon von Abschnitt 0 .: 0x" & Hex(_GUICtrlStatusBar_GetIcon($hStatus, 0)))
	_MemoWrite("IsPtr = " & IsPtr(_GUICtrlStatusBar_GetIcon($hStatus, 0)) & " IsHWnd = " & IsHWnd(_GUICtrlStatusBar_GetIcon($hStatus, 0)))
	_MemoWrite("Handle vom Icon von Abschnitt 1 .: 0x" & Hex(_GUICtrlStatusBar_GetIcon($hStatus, 1)))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Löscht ein Icon und gibt den durch das Icon belegten Speicher wieder frei
	_WinAPI_DestroyIcon($ahIcons[0])
	_WinAPI_DestroyIcon($ahIcons[1])

	GUIDelete()
EndFunc   ;==>Example1