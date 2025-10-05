; == Example (OutProcess) : ToolTip Create to an External process

#include "Extras\HelpFileInternals.au3"

#include <GUIToolTip.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True)
	Local $hButton = _MemoCreateOutProcess($hWin, "Button", 0, $sFromTo)

	Local $hToolTip2 = _GUIToolTip_Create($hWin)
	If @error Then
		_MemoMsgBox($MB_ICONERROR, "Info" & $sFromTo, "_GUIToolTip_Create()" & " @error = " & @error & @CRLF & _
				@TAB & "cannot be created in an external process")
	Else
		; should not occur
		_GUIToolTip_AddTool($hToolTip2, $hWin, "<<<This is a ToolTip", $hButton)
		_MemoWrite(">>> _GUIToolTip_GetToolCount() = " & _GUIToolTip_GetToolCount($hToolTip2))
		; GetToolCount returns 1, but tools are numbered starting from zero (0), so we have to subtract 1
		For $I = 0 To _GUIToolTip_GetToolCount($hToolTip2) - 1
			Local $aTool = _GUIToolTip_EnumTools($hToolTip2, $I)
			; only working if both processes are running in "same mode"
			_MemoWrite(">>> Tooltip info for tooltip - " & $I & @CRLF & _
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
		Next
	EndIf

	_MemoMsgBoxStatus("", Default, $hWin) ; no more action, wait GUI for closing, close also OutProcess GUI

EndFunc   ;==>Example
