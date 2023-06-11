#include <EventLog.au3>

Example()

Func Example()
	Local $hEventLog, $aData[4] = [3, 1, 2, 3]

	$hEventLog = _EventLog__Open("", "Application")
	_EventLog__Report($hEventLog, 4, 0, 2, "Administrator", "Von AutoIt3 generiertes Ereignis", $aData)
	_EventLog__Close($hEventLog)
EndFunc   ;==>Example
