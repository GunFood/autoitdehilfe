; == Example 2 : ToolTip New ToolRect to an External process

#include "Extras\HelpFileInternals.au3"

#include <GUIToolTip.au3>
#include <StructureConstants.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True) ; OK same mode, KO if different mode
	Local $hButton = _MemoCreateOutProcess($hWin, "Button", 1, $sFromTo)

	Local $hToolTip = _MemoGetHandleInProcess()

	Local $tRect = DllStructCreate($tagRECT)
	Local $aRect[4] = [150, 150, 340, 140]
	DllStructSetData($tRect, "Left", $aRect[0])
	DllStructSetData($tRect, "Top", $aRect[1])
	DllStructSetData($tRect, "Right", $aRect[2])
	DllStructSetData($tRect, "Bottom", $aRect[3])

	_GUIToolTip_NewToolRect($hToolTip, $hWin, $hButton, $aRect[0], $aRect[1], $aRect[2], $aRect[3])
	If @error Then
		_MemoMsgBox($MB_ICONERROR, "Info" & $sFromTo, "_GUIToolTip_NewToolRect()" & " @error = " & @error & @CRLF & _
				@TAB & "cannot be accessed from an external process" & @CRLF & _
				@TAB & "running in different mode")
	Else
		; only working if both processes are running in "same mode"
		Local $aTool = _GUIToolTip_GetToolInfo($hToolTip, $hWin, $hButton)
		_MemoWrite("<<< Tooltip info" & $sFromTo & @CRLF & _
				"Flags: " & @TAB & _GUIToolTip_BitsToTTF($aTool[0]) & @CRLF & _
				"HWnd: " & @TAB & "0x" & Hex($aTool[1]) & @CRLF & _
				"ID: " & @TAB & "0x" & Hex($aTool[2]) & @CRLF & _
				"Left X:" & @TAB & @TAB & $aTool[3] & @CRLF & _
				"Left Y:" & @TAB & @TAB & $aTool[4] & @CRLF & _
				"Right X:" & @TAB & $aTool[5] & @CRLF & _
				"Right Y:" & @TAB & $aTool[6] & @CRLF & _
				"Instance:" & @TAB & $aTool[7] & @CRLF & _
				"Text:" & @TAB & $aTool[8] & @CRLF & _
				"lParam:" & @TAB & $aTool[9])
	EndIf

	_MemoMsgBoxStatus("", Default, $hWin) ; no more action, wait GUI for closing, close also OutProcess GUI

EndFunc   ;==>Example
