#include <EventLog.au3>

Example()

Func Example()
	Local $hEventLog

	$hEventLog = _EventLog__Open("", "Anwendung")
	_EventLog__Clear($hEventLog, "C:\EventLog.bak")
	_EventLog__Close($hEventLog)
EndFunc   ;==>Example
