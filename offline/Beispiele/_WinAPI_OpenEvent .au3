#include <WinAPIError.au3>
#include <WinAPIProc.au3>

Local $iEvent, $sErrMsg
Global $g_bCycle = True
HotKeySet("{ESC}", "_Exit")

Local $sEvent = "Global\MyTestEvent"
Global $g_hEvent = _WinAPI_CreateEvent(0, True, True, $sEvent)
If @extended Then
	$sErrMsg = _WinAPI_GetErrorMessage(@extended)
	ConsoleWrite('_WinAPI_CreateEvent("..., ' & $sEvent & '") = ' & $g_hEvent & @CRLF & @TAB & $sErrMsg & @CRLF)
	Exit
EndIf

Local $hEvent = _WinAPI_OpenEvent($sEvent) ;Get event handle
If @extended Then
	$sErrMsg = _WinAPI_GetErrorMessage(@extended)
	ConsoleWrite('_WinAPI_OpenEvent("' & $sEvent & '") = ' & $hEvent & @CRLF & @TAB & $sErrMsg & @CRLF)
	Exit
EndIf

While $g_bCycle = True
	$iEvent = _WinAPI_WaitForSingleObject($hEvent, 1000) ;Get event from handle
	Switch $iEvent
		Case -1        ;WAIT_FAILED
			$sErrMsg = _WinAPI_GetLastErrorMessage()
			ConsoleWrite("_WinAPI_WaitForSingleObject() = WAIT_FAILED" & @CRLF & @TAB & $sErrMsg & @CRLF)
			ExitLoop
		Case 0        ;WAIT_OBJECT_0
			_WinAPI_ResetEvent($hEvent)
			ConsoleWrite("_WinAPI_WaitForSingleObject() = Event appeared as expected." & @CRLF)
			ExitLoop
		Case 0x00000102    ;WAIT_TIMEOUT
			ConsoleWrite("_WinAPI_WaitForSingleObject() = WAIT_TIMEOUT : Event not appeared." & @CRLF)
		Case 0x00000080    ;WAIT_ABANDONED
			ConsoleWrite("_WinAPI_WaitForSingleObject() = WAIT_ABANDONED" & @CRLF)
			ExitLoop
	EndSwitch
	Sleep(1000)
WEnd    ;==>While

Func _Exit()
	$g_bCycle = False
	_WinAPI_ResetEvent($g_hEvent)
EndFunc   ;==>_Exit
