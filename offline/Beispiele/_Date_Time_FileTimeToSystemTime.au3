#include <Date.au3>
#include <FontConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $tFile, $tSystem

	; Erstellen der GUI
	GUICreate("Zeit", 400, 300)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9,  $FW_NORMAL, $GUI_FONTNORMAL, "Courier New")
	GUISetState(@SW_SHOW)

	; Entschlüsseln der Datei Zeit
	$tFile = _Date_Time_EncodeFileTime(@MON, @MDAY, @YEAR, @HOUR, @MIN, @SEC)
	$tSystem = _Date_Time_FileTimeToSystemTime(DllStructGetPtr($tFile))
	MemoWrite("System Dateizeit .: " & _Date_Time_SystemTimeToDateTimeStr($tSystem))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
