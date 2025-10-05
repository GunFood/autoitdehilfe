#include "Extras\HelpFileInternals.au3"

#include <EventLog.au3>
#include <FontConstants.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $hEventLog, $aEvent

	; Erstellt eine GUI
	GUICreate("EventLog", 600, 300)
	_MemoCreate(2, 2, 596, 294, 0)
	GUISetState(@SW_SHOW)

	; Liest den aktuellsten Ereignis-Datensatz
	$hEventLog = _EventLog__Open("", "Application") ; Anwendungs-Log
	$aEvent = _EventLog__Read($hEventLog, True, False) ; liest das letzte Event
;~ 	$hEventLog = _EventLog__Open("", "System"); System-Log
;~	$aEvent = _EventLog__Read($hEventLog)
;~	$aEvent = _EventLog__Read($hEventLog, True, False) ; Nächsten Eintrag lesen
	_MemoWrite("Ergebnis .........: " & $aEvent[0])
	_MemoWrite("Datensatznummer ..: " & $aEvent[1])
	_MemoWrite("Übermittelt ......: " & $aEvent[2] & " " & $aEvent[3])
	_MemoWrite("Erstellt .........: " & $aEvent[4] & " " & $aEvent[5])
	_MemoWrite("Ereignis-ID ......: " & $aEvent[6])
	_MemoWrite("Typ ..............: " & $aEvent[8])
	_MemoWrite("Kategorie ........: " & $aEvent[9])
	_MemoWrite("Quelle ...........: " & $aEvent[10])
	_MemoWrite("Computer .........: " & $aEvent[11])
	_MemoWrite("Benutzer .........: " & $aEvent[12])
	_MemoWrite(@CRLF & "Beschreibung: " & @CRLF & @CRLF & $aEvent[13])
	_EventLog__Close($hEventLog)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example