; == Example (OutProcess) : ToolTip Add Tool to an External process

#include "Extras\HelpFileInternals.au3"

#include <GUIToolTip.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True) ; OK same mode, KO if different mode

	Local $hToolTip = _MemoGetHandleInProcess()
	Local $hButton = _MemoCreateOutProcess($hWin, "Button", 0, $sFromTo)

	; add a tool to the tooltip control
	Local $iRet = _GUIToolTip_AddTool($hToolTip, $hWin, "<<<This is a ToolTip", $hButton)
	If @error Then
		_MemoMsgBox($MB_ICONERROR, "Info" & $sFromTo, "_GUIToolTip_AddTool()" & " @error = " & @error & @CRLF & _
				@TAB & "cannot be added to an external process" & @CRLF & _
				@TAB & "running in different mode")
	Else
		; only working if both processes are running in "same mode"
		_MemoWrite("Info" & $sFromTo & " _GUIToolTip_AddTool() $iRet= " & $iRet)
		_Memowrite(_GUIToolTip_GetText($hWin, $hToolTip, $hButton))
	EndIf

	_MemoMsgBoxStatus("", Default, $hWin) ; no more action, wait GUI for closing, close also OutProcess GUI

EndFunc   ;==>Example
