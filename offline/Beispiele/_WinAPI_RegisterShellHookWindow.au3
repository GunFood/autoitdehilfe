#include <APISysConstants.au3>
#include <WinAPISysWin.au3>

Opt('TrayAutoPause', 0)

OnAutoItExitRegister(OnAutoItExit)

Global $g_hForm = GUICreate('')
GUIRegisterMsg(_WinAPI_RegisterWindowMessage('SHELLHOOK'), WM_SHELLHOOK)
_WinAPI_RegisterShellHookWindow($g_hForm)

ToolTip("Type ESC to exit the script")
HotKeySet("{ESC}", "_Exit")

While 1
	Sleep(100)
WEnd

Func WM_SHELLHOOK($hWnd, $iMsg, $wParam, $lParam)
	#forceref $iMsg

	Local $sTitle = WinGetTitle($lParam)
	Switch $hWnd
		Case $g_hForm
			Switch $wParam
				Case $HSHELL_REDRAW
					ConsoleWrite('Neu gezeichnet: ' & $sTitle & @CRLF)
				Case $HSHELL_WINDOWACTIVATED, $HSHELL_RUDEAPPACTIVATED
					ConsoleWrite('Aktiviert: ' & $sTitle & @CRLF)
			EndSwitch
	EndSwitch
EndFunc   ;==>WM_SHELLHOOK

Func OnAutoItExit()
	_WinAPI_DeregisterShellHookWindow($g_hForm)
EndFunc   ;==>OnAutoItExit

Func _Exit()
	Exit 1
EndFunc   ;==>_Exit
