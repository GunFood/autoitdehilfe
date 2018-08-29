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
	MemoWrite("EventLog voll? ..........: " & _EventLog__Full($hEventLog))
	MemoWrite("Anzahl der Log-Einträge .: " & _EventLog__Count($hEventLog))
	MemoWrite("Ältester Log-Eintrag: ...: " & _EventLog__Oldest($hEventLog))
	_EventLog__Close($hEventLog)

	; Die Schleife wiederholt sich, bis der Benutzer das Fenster schließt
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
