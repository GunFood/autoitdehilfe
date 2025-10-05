#include "Extras\HelpFileInternals.au3"

#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIError.au3>
#include <WindowsStylesConstants.au3>

; Unter und über Vista muß die Windows API "SetLocalTime" möglicherweise von der Systemsicherheit ausgenommen werden

Example()

Func Example()
	; Erstellt die GUI
	GUICreate("Datum Zeit: Setzt und ermittelt die Systemzeit (v" & @AutoItVersion & ")", 400, 300)
	_MemoCreate(2, 2, 396, 296, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Auslesen der aktuellen Systemzeit
	Local $tCur = _Date_Time_GetSystemTime()
	_MemoWrite("Aktuelle/s System Zeit/Datum .: " & _Date_Time_SystemTimeToDateTimeStr($tCur))

	; Setzt eine neue Systemzeit
	Local $tNew = _Date_Time_EncodeSystemTime(8, 19, @YEAR, 3, 10, 45)
	If Not _Date_Time_SetSystemTime($tNew) Then
		MsgBox($MB_SYSTEMMODAL, "Fehler", "Die Systemzeit kann nicht gesetzt werden" & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
		Exit
	EndIf
	$tNew = _Date_Time_GetSystemTime()
	_MemoWrite("Neue/s System Zeit/Datum .....: " & _Date_Time_SystemTimeToDateTimeStr($tNew))

	; Setzt die Systemzeit zurück
	_Date_Time_SetSystemTime($tCur)

	; Auslesen der aktuellen Systemzeit
	$tCur = _Date_Time_GetSystemTime()
	_MemoWrite("Wiederhergestellte/s System Zeit/Datum .: " & _Date_Time_SystemTimeToDateTimeStr($tCur))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
