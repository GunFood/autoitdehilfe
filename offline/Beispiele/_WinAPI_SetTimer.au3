#include <Misc.au3>
#include <WinAPISysWin.au3>

Opt('TrayAutoPause', 0)

Example()

Func Example()
	Local $hTimerProc = DllCallbackRegister('_TimerProc', 'none', 'hwnd;uint;uint_ptr;dword')

	Local $iTimerID = _WinAPI_SetTimer(0, 0, 1000, DllCallbackGetPtr($hTimerProc))

	; Skript durch Drücken von {ESC} schließen

	Do
		Sleep(100)
	Until _IsPressed('1B')

	_WinAPI_KillTimer(0, $iTimerID)
	DllCallbackFree($hTimerProc)

EndFunc   ;==>_Example

Func _TimerProc($hWnd, $iMsg, $iTimerID, $iTime)
	#forceref $hWnd, $iMsg, $iTimerID, $iTime
	Local Static $iCount = 1

	ToolTip("$iCount = " & $iCount, Default, Default, "{ESC} drücken um das Skript zu beenden")
	$g_iCount += 1
EndFunc   ;==>_TimerProc
