#include <EventLog.au3>
#include <FontConstants.au3>
#include <GUIConstantsEx.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hEventLog

	; Erstellt das GUI
	GUICreate("EventLog", 600, 300)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 596, 294, 0)
	GUICtrlSetFont($g_idMemo, 9, $FW_NORMAL, $GUI_FONTNORMAL, "Courier New")
	GUISetState(@SW_SHOW)

	$hEventLog = _EventLog__Open("", "Application")
	_EventLog__Backup($hEventLog, "C:\EventLog.bak")
	_EventLog__Close($hEventLog)

	$hEventLog = _EventLog__OpenBackup("", "C:\EventLog.bak")
	MemoWrite("Log komplett ..........: " & _EventLog__Full($hEventLog))
	MemoWrite("Log Anzahl Aufnahmen...: " & _EventLog__Count($hEventLog))
	MemoWrite("Log ältester Datensatz : " & _EventLog__Oldest($hEventLog))
	_EventLog__Close($hEventLog)

	; Die Schleife wiederholt sich, bis der Benutzer das Fenster schließt
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo- Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
