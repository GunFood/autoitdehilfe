#include <EventLog.au3>
#include <FontConstants.au3>
#include <GUIConstantsEx.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hEventLog, $aEvent

	; Erstellt eine GUI
	GUICreate("EventLog", 600, 300)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 596, 294, 0)
	GUICtrlSetFont($g_idMemo, 9, $FW_NORMAL, $GUI_FONTNORMAL, "Courier New")
	GUISetState(@SW_SHOW)

	; Liest den aktuellsten Ereignis-Datensatz
	$hEventLog = _EventLog__Open("", "Application") ; Anwendungs-Log
	$aEvent = _EventLog__Read($hEventLog, True, False) ; liest das letzt Event
;~ 	$hEventLog = _EventLog__Open("", "System"); System-Log
;~	$aEvent = _EventLog__Read($hEventLog)
;~	$aEvent = _EventLog__Read($hEventLog, True, False) ; Nächsten Eintrag lesen
	MemoWrite("Ergebnis .........: " & $aEvent[0])
	MemoWrite("Datensatznummer ..: " & $aEvent[1])
	MemoWrite("Übermittelt ......: " & $aEvent[2] & " " & $aEvent[3])
	MemoWrite("Erstellt .........: " & $aEvent[4] & " " & $aEvent[5])
	MemoWrite("Ereignis-ID ......: " & $aEvent[6])
	MemoWrite("Typ ..............: " & $aEvent[8])
	MemoWrite("Kategorie ........: " & $aEvent[9])
	MemoWrite("Quelle ...........: " & $aEvent[10])
	MemoWrite("Computer .........: " & $aEvent[11])
	MemoWrite("Benutzer .........: " & $aEvent[12])
	MemoWrite(@CRLF & "Beschreibung: " & @CRLF & @CRLF & $aEvent[13])
	_EventLog__Close($hEventLog)


	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
