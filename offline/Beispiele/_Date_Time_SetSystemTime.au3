#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIError.au3>
#include <WindowsConstants.au3>

; Unter Vista muß die Windows API "SetSystemTime" möglicherweise von der Systemsicherheit ausgenommen werden

Global $g_idMemo

Example()

Func Example()
	Local $tCur, $tNew

	; Erstellt die GUI
	GUICreate("Zeit", 400, 300)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Auslesen der aktuellen Systemzeit
	$tCur = _Date_Time_GetSystemTime()
	MemoWrite("Aktuelle/s System Zeit/Datum .: " & _Date_Time_SystemTimeToDateTimeStr($tCur))

	; Setzt eine neue Systemzeit
	$tNew = _Date_Time_EncodeSystemTime(8, 19, @YEAR, 3, 10, 45)
	If Not _Date_Time_SetSystemTime($tNew) Then
		MsgBox($MB_SYSTEMMODAL, "Fehler", "Die Systemzeit kann nicht gesetzt werden" & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
		Exit
	EndIf
	$tNew = _Date_Time_GetSystemTime()
	MemoWrite("Neue/s System Zeit/Datum .....: " & _Date_Time_SystemTimeToDateTimeStr($tNew))

	; Setzt die Systemzeit zurück
	_Date_Time_SetSystemTime($tCur)

	; Auslesen der aktuellen Systemzeit
	$tCur = _Date_Time_GetSystemTime()
	MemoWrite("Wiederhergestellte/s System Zeit/Datum .: " & _Date_Time_SystemTimeToDateTimeStr($tCur))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
