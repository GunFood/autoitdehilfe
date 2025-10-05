; == Example 2 : ToolTip Update TipText to an External process

#include "Extras\HelpFileInternals.au3"

#include <GUIToolTip.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True) ; OK same mode, KO if different mode
	Local $hButton = _MemoCreateOutProcess($hWin, "Button", 1, $sFromTo)

	Local $hToolTip = _MemoGetHandleInProcess()

	_GUIToolTip_UpdateTipText($hToolTip, $hWin, $hButton, '<<< text')
	If @error Then
		_MemoMsgBox($MB_ICONERROR, "Info" & $sFromTo, "_GUIToolTip_UpdateTipText()" & " @error = " & @error & @CRLF & _
				@TAB & "cannot be accessed from an external process" & @CRLF & _
				@TAB & "running in different mode")
	Else
		; only working if both processes are running in "same mode"
		Local $aTool = _GUIToolTip_GetToolInfo($hToolTip, $hWin, $hButton)
		_MemoWrite("Tooltip info" & @CRLF & _
				"Flags: " & @TAB & _GUIToolTip_BitsToTTF($aTool[0]) & @CRLF & _
				"HWnd: " & @TAB & "0x" & Hex($aTool[1]) & @CRLF & _
				"ID: " & @TAB & "0x" & Hex($aTool[2]) & @CRLF & _
				"Left X:" & @TAB & $aTool[3] & @CRLF & _
				"Left Y:" & @TAB & $aTool[4] & @CRLF & _
				"Right X:" & @TAB & $aTool[5] & @CRLF & _
				"Right Y:" & @TAB & $aTool[6] & @CRLF & _
				"Instance:" & @TAB & $aTool[7] & @CRLF & _
				"Text:" & @TAB & $aTool[8] & @CRLF & _
				"lParam:" & @TAB & $aTool[9])
	EndIf

	_MemoMsgBoxStatus("", Default, $hWin) ; no more action, wait GUI for closing, close also OutProcess GUI

EndFunc   ;==>Example
