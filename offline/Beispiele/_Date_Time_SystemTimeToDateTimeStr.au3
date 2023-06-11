#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $tTime

	; Erstellt die GUI
	GUICreate("Datum / Zeit", 500, 300)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 496, 296, $WS_VSCROLL)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Zeigt Systemdatum und -zeit
	$tTime = _Date_Time_GetSystemTime()
	MemoWrite("Systemdatum/-zeit (0)       : " & _Date_Time_SystemTimeToDateTimeStr($tTime))
	MemoWrite("Systemdatum/-zeit (1)       : " & _Date_Time_SystemTimeToDateTimeStr($tTime, 1))
	MemoWrite("Systemdatum/-zeit (ISO8601) : " & _Date_Time_SystemTimeToDateTimeStr($tTime, 3, 1))
	MemoWrite("Systemdatum/-zeit (GMT)     : " & _Date_Time_SystemTimeToDateTimeStr($tTime, 2, 1))
	; Zeigt die lokale(s) Datum/-zeit
	$tTime = _Date_Time_GetLocalTime()
	MemoWrite("Lokale(s) Datum/-zeit (GMT)     : " & _Date_Time_SystemTimeToDateTimeStr($tTime, 2))
	MemoWrite("Lokale(s) Datum/-zeit (ISO8601) : " & _Date_Time_SystemTimeToDateTimeStr($tTime, 3))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
