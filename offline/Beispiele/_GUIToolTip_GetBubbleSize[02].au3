; == Example (OutProcess) : ToolTip Get Bubble Size to an External process

#include "Extras\HelpFileInternals.au3"

#include <GUIToolTip.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True) ; OK same mode, KO if different mode
	_MemoCreateOutProcess($hWin, "Button", 1, $sFromTo)

	Local $hToolTip = _MemoGetHandleInProcess()
	Local $hButton = _MemoCreateOutProcess($hWin, "Button", 0, $sFromTo)

	Local $iSize = _GUIToolTip_GetBubbleSize($hToolTip, $hWin, $hButton)
	Local $iBubbleHeight = _GUIToolTip_GetBubbleHeight($hToolTip, $hWin, $hButton)
	Local $iBubbleWidth = _GUIToolTip_GetBubbleWidth($hToolTip, $hWin, $hButton)
	If @error Then
		_MemoMsgBox($MB_ICONERROR, "Info" & $sFromTo, "_GUIToolTip_GetBubbleSize()" & " @error = " & @error & @CRLF & _
				@TAB & "cannot be enumerated from an external process" & @CRLF & _
				@TAB & "running in different mode")
	Else
		; Display the height of the tooltip bubble in pixels
		_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Bubble Size = " & @TAB & "0x" & Hex($iSize) & @CRLF & _
				"Bubble Height = " & @TAB & $iBubbleHeight & " " & " Pixels" & @CRLF & _
				"Bubble Width = " & @TAB & $iBubbleWidth & " Pixels")
	EndIf

	_MemoMsgBoxStatus("", Default, $hWin) ; no more action, wait GUI for closing, close also OutProcess GUI

EndFunc   ;==>Example
