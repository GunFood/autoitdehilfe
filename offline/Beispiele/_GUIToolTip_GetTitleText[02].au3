; == Example (OutProcess) : ToolTip Get TitleText from an External process

#include "Extras\HelpFileInternals.au3"

#include <GUIToolTip.au3>
#include <MsgBoxConstants.au3>
#include <ToolTipConstants.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo) ; OK also in "same mode"
	_MemoCreateOutProcess($hWin, "Button", 0, $sFromTo)

	Local $hToolTip = _MemoGetHandleInProcess()

	; Set the title of the tooltip
	_GUIToolTip_SetTitle($hToolTip, '>>>New Title Text', $TTI_WARNING)
	If @error Then
		_MemoMsgBox($MB_ICONERROR, "Info" & $sFromTo, " _GUIToolTip_SetTitle()" & " @error = " & @error & @CRLF & _
				"cannot be Set by an external process")
	Else
		Local $sTitleText = _GUIToolTip_GetTitleText($hToolTip)
		If @error Then
			_MemoMsgBox($MB_ICONERROR, "Info" & $sFromTo, "_GUIToolTip_GetTitleText()" & " @error = " & @error & @CRLF & _
					@TAB & "cannot be retrieved from an external process" & @CRLF & _
					@TAB & "running in different mode")
		Else
			_MemoWrite("Title Bitmap" & $sFromTo & " = " & $sTitleText)
		EndIf
	EndIf

	_MemoMsgBoxStatus("", Default, $hWin) ; no more action, wait GUI for closing, close also OutProcess GUI

EndFunc   ;==>Example
