; == Example 2 : ToolTip Track Activate to an External process

#include "Extras\HelpFileInternals.au3"

#include <GUIToolTip.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo) ; OK also in "same mode"
	Local $hButton = _MemoCreateOutProcess($hWin, "Button", 0, $sFromTo)

	Local $hToolTip = _MemoGetHandleInProcess()

	_GUIToolTip_TrackActivate($hToolTip, False, $hWin, $hButton)
	If @error Then
		_MemoMsgBox($MB_ICONERROR, "Info" & $sFromTo, "_GUIToolTip_TrackActivate()" & " @error = " & @error & @CRLF & _
				@TAB & "cannot be accessed from an external process" & @CRLF & _
				@TAB & "running in different mode")
	Else
		_MemoMsgBox($MB_SYSTEMMODAL, "ToolTip TrackActivate" & $sFromTo, "Deactivate")
	EndIf

	_MemoMsgBoxStatus("", Default, $hWin) ; no more action, wait GUI for closing, close also OutProcess GUI

EndFunc   ;==>Example
