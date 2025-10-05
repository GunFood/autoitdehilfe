; == Example (OutProcess) : ToolTip Get Text to an External process

#include "Extras\HelpFileInternals.au3"

#include <GUIToolTip.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True) ; OK same mode, KO if different mode
	Local $hButton = _MemoCreateOutProcess($hWin, "Button", 0, $sFromTo)

	Local $hToolTip = _MemoGetHandleInProcess()

	; Retrieve the text of the tool
	Local $sText = _GUIToolTip_GetText($hToolTip, $hWin, $hButton)
	If @error Then
		_MemoMsgBox($MB_ICONERROR, "Info" & $sFromTo, "_GUIToolTip_GetText()" & " @error = " & @error & @CRLF & _
				@TAB & "cannot be accessed by an external process" & @CRLF & _
				@TAB & "running in different mode")
	Else
		; only working if both processes are running in "same mode"
		_MemoWrite('Info' & $sFromTo & @CRLF & $sText)
	EndIf

	_MemoMsgBoxStatus("", Default, $hWin) ; no more action, wait GUI for closing, close also OutProcess GUI

EndFunc   ;==>Example
