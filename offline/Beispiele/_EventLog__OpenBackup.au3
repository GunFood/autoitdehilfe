#include "Extras\HelpFileInternals.au3"

#include <EventLog.au3>
#include <FontConstants.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $hEventLog

	; Erstellt das GUI
	GUICreate("EventLog", 600, 300)
	_MemoCreate(2, 2, 596, 294, 0)
	GUISetState(@SW_SHOW)

	$hEventLog = _EventLog__Open("", "Application")
	_EventLog__Backup($hEventLog, "C:\EventLog.bak")
	_EventLog__Close($hEventLog)

	$hEventLog = _EventLog__OpenBackup("", "C:\EventLog.bak")
	_MemoWrite("Log komplett ..........: " & _EventLog__Full($hEventLog))
	_MemoWrite("Log Anzahl Aufnahmen...: " & _EventLog__Count($hEventLog))
	_MemoWrite("Log ältester Datensatz : " & _EventLog__Oldest($hEventLog))
	_EventLog__Close($hEventLog)

	; Die Schleife wiederholt sich, bis der Benutzer das Fenster schließt
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example