; == Example 2 : ToolTip Set Title to an External process

#include "Extras\HelpFileInternals.au3"

#include <GUIToolTip.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo) ; OK also in "same mode"
	_MemoCreateOutProcess($hWin, "Button", 2, $sFromTo)

	Local $hToolTip = _MemoGetHandleInProcess()

	; Set the title of the tooltip
	_GUIToolTip_SetTitle($hToolTip, '>>>New Title Text', $TTI_WARNING)
	If @error Then
		_MemoMsgBox($MB_ICONERROR, "Info" & $sFromTo, "_GUIToolTip_SetTitle()" & " @error = " & @error & @CRLF & _
				@TAB & "cannot be accessed from an external process" & @CRLF & _
				@TAB & "running in different mode")
	Else
		_MemoMsgBox($MB_SYSTEMMODAL, "ToolTip Title" & $sFromTo, _GUIToolTip_GetTitleText($hToolTip))
	EndIf

	_MemoMsgBoxStatus("", Default, $hWin) ; no more action, wait GUI for closing, close also OutProcess GUI

EndFunc   ;==>Example
