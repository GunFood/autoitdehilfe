#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIError.au3>
#include <WindowsConstants.au3>

; Unter Vista muß die Windows API "SetLocalTime" möglicherweise von der Systemsicherheit ausgenommen werden

Global $g_idMemo

Example()

Func Example()
	Local $tCur, $tNew

	; Erstellt die GUI
	GUICreate("Zeit", 400, 300)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Anzeigen der momentan eingestellten lokalen Zeit
	$tCur = _Date_Time_GetLocalTime()
	MemoWrite("Aktuelle/s Zeit/Datum .: " & _Date_Time_SystemTimeToDateTimeStr($tCur))

	; Setzt eine neue lokale Zeit
	$tNew = _Date_Time_EncodeSystemTime(8, 19, @YEAR, 3, 10, 45)
	If Not _Date_Time_SetLocalTime($tNew) Then
		MsgBox($MB_SYSTEMMODAL, "Fehler", "Die Systemzeit kann nicht gesetzt werden" & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
		Exit
	EndIf
	$tNew = _Date_Time_GetLocalTime()
	MemoWrite("Neue/s Zeit/Datum .....: " & _Date_Time_SystemTimeToDateTimeStr($tNew))

	; Zurücksetzen der lokalen Zeit
	_Date_Time_SetLocalTime($tCur)

	; Anzeigen der momentan eingestellten lokalen Zeit
	$tCur = _Date_Time_GetLocalTime()
	MemoWrite("Aktuelle/s Zeit/Datum .: " & _Date_Time_SystemTimeToDateTimeStr($tCur))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
