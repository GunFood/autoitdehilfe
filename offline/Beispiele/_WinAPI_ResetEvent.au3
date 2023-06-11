#include <WinAPI.au3>
#include <WinAPIProc.au3> ;needed for _WinAPI_ResetEvent

Global $tEvents = DllStructCreate("handle Event[3];")
$tEvents.Event(1) = _WinAPI_CreateEvent(0, True, False)
$tEvents.Event(2) = _WinAPI_CreateEvent(0, True, False)
$tEvents.Event(3) = _WinAPI_CreateEvent(0, True, False)

HotKeySet("{ESC}", "_Exit")
AdlibRegister("_FireEvent_1", 500)
AdlibRegister("_FireEvent_2", 800)

Global $iEvent
While 1
	;$iEvent = _WinAPI_WaitForMultipleObjects(3, $tEvents, False, 100) ;Maybe future version
	$iEvent = _WinAPI_WaitForMultipleObjects(3, DllStructGetPtr($tEvents), False, 100)
	Switch $iEvent
		Case 0
			ConsoleWrite("+ First Event" & @CRLF)
			_WinAPI_ResetEvent($tEvents.Event(1))
		Case 1
			ConsoleWrite("> Second Event" & @CRLF)
			_WinAPI_ResetEvent($tEvents.Event(2))
		Case 2
			ConsoleWrite("! Exit Event" & @CRLF)
			AdlibUnRegister("_FireEvent_1")
			AdlibUnRegister("_FireEvent_2")
			_WinAPI_CloseHandle($tEvents.Event(1))
			_WinAPI_CloseHandle($tEvents.Event(2))
			_WinAPI_CloseHandle($tEvents.Event(3))
			ExitLoop
		Case -1 ;Error
			ExitLoop
	EndSwitch
WEnd


Func _Exit()
	_WinAPI_SetEvent($tEvents.Event(3))
EndFunc   ;==>_Exit


Func _FireEvent_1()
	_WinAPI_SetEvent($tEvents.Event(1))
EndFunc   ;==>_FireEvent_1


Func _FireEvent_2()
	_WinAPI_SetEvent($tEvents.Event(2))
EndFunc   ;==>_FireEvent_2
