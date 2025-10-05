#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIShellEx.au3>
#include <WindowsNotifsConstants.au3>

Local $hGUI = GUICreate('SubClass Three Input Controls', 400, 300)
GUICtrlCreateLabel("Double click to get subclass info", 10, 30)
Global $g_idInput01 = GUICtrlCreateInput('', 10, 50, 380, 20)
GUICtrlCreateLabel("Double click to get subclass info", 10, 100)
Global $g_idInput02 = GUICtrlCreateInput('', 10, 120, 380, 20)

GUICtrlCreateLabel("Enter a new info number for First Input," & @CRLF & "then double click on first Input to see the new reference data", 10, 180)
Global $idInput03 = GUICtrlCreateInput('', 10, 220, 380, 20)

Local $hInputSubClassProc = DllCallbackRegister('_InputSubClassProc', 'LRESULT', 'HWND;UINT;WPARAM;LPARAM;UINT_PTR;DWORD_PTR')
Global $g_pInputSubClassProc = DllCallbackGetPtr($hInputSubClassProc)

If $g_pInputSubClassProc = 0 Then
	MsgBox($MB_ICONERROR, 'Subclass Test', 'Call to DllCallbackRegister failed.')
	Exit
EndIf

_WinAPI_SetWindowSubclass(GUICtrlGetHandle($g_idInput01), $g_pInputSubClassProc, 1000, 111)
If @error Then
	MsgBox($MB_ICONERROR, 'Subclass Test', 'Call to WinProc for inp010 failed.')
	Exit
EndIf

_WinAPI_SetWindowSubclass(GUICtrlGetHandle($g_idInput02), $g_pInputSubClassProc, 2000, 222)
If @error Then
	MsgBox($MB_ICONERROR, 'Subclass Test', 'Call to WinProc for inp020 failed.')
	Exit
EndIf

GUISetState()

Local $iNewRefData
While True
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			ExitLoop
		Case $idInput03
			$iNewRefData = Number(GUICtrlRead($idInput03))
			; Update the reference data number
			_WinAPI_SetWindowSubclass(GUICtrlGetHandle($g_idInput01), $g_pInputSubClassProc, 1000, $iNewRefData)
			ToolTip(">>> outside subclass Reference data = " & _WinAPI_GetWindowSubclass(GUICtrlGetHandle($g_idInput01), $g_pInputSubClassProc, 1000) & @CRLF)
	EndSwitch
WEnd

_WinAPI_RemoveWindowSubclass(GUICtrlGetHandle($g_idInput01), $g_pInputSubClassProc, 1000)
_WinAPI_RemoveWindowSubclass(GUICtrlGetHandle($g_idInput02), $g_pInputSubClassProc, 2000)
DllCallbackFree($hInputSubClassProc)

Func _InputSubClassProc($hWnd, $iMsg, $wParam, $lParam, $iSubClassID, $iRefData)
	Switch $iMsg
		Case $WM_LBUTTONDBLCLK
			Switch $iSubClassID
				Case 1000
					GUICtrlSetData($g_idInput01, 'It was double clicked, data = ' & $iRefData)
				Case 2000
					GUICtrlSetData($g_idInput02, 'It was double clicked, data = ' & $iRefData)
			EndSwitch
			ToolTip("$IdSubclaa = " & $iSubClassID & @CRLF & "Reference data = " & _WinAPI_GetWindowSubclass($hWnd, $g_pInputSubClassProc, $iSubClassID) & @CRLF)
	EndSwitch

	Return _WinAPI_DefSubclassProc($hWnd, $iMsg, $wParam, $lParam)
EndFunc   ;==>_InputSubClassProc
