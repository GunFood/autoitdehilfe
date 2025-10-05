; == Beispiel 2 direkte Verwendung mit Icon-Datei

#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WinAPIIcons.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Setzt und ermittelt das Icon (v" & @AutoItVersion & ")", 500, 320)
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Erstellt ein Memo Control
	_MemoCreate(2, 8, 444, 259)
	GUISetState(@SW_SHOW)

	; Abschnitte setzen
	Local $aParts[3] = [75, 150, 300] ;, 400]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 0")
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1", 1)

	; Setzt die Icons
	Local $hIcon1 = _GUICtrlStatusBar_SetIcon($hStatus, 0, 23, "shell32.dll")
	Local $hIcon2 = _GUICtrlStatusBar_SetIcon($hStatus, 1, 23, "shell32.dll")

	GUISetState(@SW_SHOW)

	; Zeigt die Handles der Icons
	_MemoWrite("Handle vom Icon von Abschnitt 0 .: 0x" & Hex(_GUICtrlStatusBar_GetIcon($hStatus, 0)))
	_MemoWrite("Handle vom Icon von Abschnitt 1 .: 0x" & Hex(_GUICtrlStatusBar_GetIcon($hStatus, 1)))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ISpeicherplatz der Icons freigeben
	_WinAPI_DestroyIcon($hIcon1)
	_WinAPI_DestroyIcon($hIcon2)

	GUIDelete()
EndFunc   ;==>Example