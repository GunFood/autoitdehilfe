#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WinAPIIcons.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example1()

Func Example1()
	Local $hGui, $ahIcons[2], $hStatus
	Local $aParts[4] = [75, 150, 300, 400]

	; Erstellt eine GUI
	$hGui = GUICreate("StatusBar: Icon ermitteln (Beispiel 1)", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGui)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Abschnitte setzen
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1")
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 1)

	; Setzt die Icons
	$ahIcons[0] = _WinAPI_LoadShell32Icon(23)
	$ahIcons[1] = _WinAPI_LoadShell32Icon(40)
	_GUICtrlStatusBar_SetIcon($hStatus, 0, $ahIcons[0])
	_GUICtrlStatusBar_SetIcon($hStatus, 1, $ahIcons[1])

	; Zeigt die Handles der Icons
	MemoWrite("Handle vom Icon von Abschnitt 1 .: 0x" & Hex(_GUICtrlStatusBar_GetIcon($hStatus, 0)))
	MemoWrite("IsPtr = " & IsPtr(_GUICtrlStatusBar_GetIcon($hStatus, 0)) & " IsHWnd = " & IsHWnd(_GUICtrlStatusBar_GetIcon($hStatus, 0)))
	MemoWrite("Handle vom Icon von Abschnitt 1 .: 0x" & Hex(_GUICtrlStatusBar_GetIcon($hStatus, 1)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Löscht ein Icon und gibt den durch das Icon belegten Speicher wieder frei
	_WinAPI_DestroyIcon($ahIcons[0])
	_WinAPI_DestroyIcon($ahIcons[1])
	GUIDelete()
EndFunc   ;==>Example1

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
