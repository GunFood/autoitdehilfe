; == Example 2 - $pTimerFunc = 0 to use a $WM_TIMER callback

#include <GUIConstantsEx.au3>
#include <Misc.au3>
#include <WinAPISysWin.au3>
#include <WindowsNotifsConstants.au3>

Opt('TrayAutoPause', 0)

Example()

Func Example()
	GUIRegisterMsg($WM_TIMER, "WM_TIMER")

	Local $hGUI = GUICreate("_WinAPI_SetTimer[2] - v(" & @AutoItVersion & ")")
	Local $iTimerID = 999
	$iTimerID = _WinAPI_SetTimer($hGUI, $iTimerID, 1000, 0)

	; close script by pressing {ESC]
	Do
		Sleep(100)
	Until _IsPressed('1B')

	_WinAPI_KillTimer($hGUI, $iTimerID)

	GUIRegisterMsg($WM_TIMER, "")
EndFunc   ;==>Example

Func WM_TIMER($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam, $ilParam
	Local Static $iCount = 1

	ToolTip("$iCount = " & $iCount, Default, Default, "Press {ESC} to close the script")
	$iCount += 1

	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_TIMER
