#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $tTime, $aTime

	; Erstellt die GUI
	GUICreate("Zeit", 400, 300)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt die momentane Systemzeit
	$tTime = _Date_Time_GetSystemTime()
	$aTime = _Date_Time_SystemTimeToArray($tTime)
	MemoWrite("Monat ........: " & $aTime[0])
	MemoWrite("Tag ..........: " & $aTime[1])
	MemoWrite("Jahr .........: " & $aTime[2])
	MemoWrite("Stunde .........: " & $aTime[3])
	MemoWrite("Minute .......: " & $aTime[4])
	MemoWrite("Sekunde .......: " & $aTime[5])
	MemoWrite("Millisekunde .: " & $aTime[6])
	MemoWrite("Wochentag ..: " & $aTime[7])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
