#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $tLocal, $tSystem

	; Erstellt eine GUI
	GUICreate("Zeit", 400, 300)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Umwandlung der Systemzeit in die Lokalzeit
	$tSystem = _Date_Time_GetSystemTime()
	$tLocal = _Date_Time_SystemTimeToTzSpecificLocalTime($tSystem)
	MemoWrite("Systemzeit -> Lokalzeit: " & _Date_Time_SystemTimeToDateTimeStr($tLocal))

	$tLocal = _Date_Time_GetLocalTime()
	$tSystem = _Date_Time_TzSpecificLocalTimeToSystemTime($tLocal)
	MemoWrite("Lokalzeit -> Systemzeit: " & _Date_Time_SystemTimeToDateTimeStr($tSystem))

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
