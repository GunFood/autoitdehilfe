; == Example 3 : StatusBar Get/Set Text to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiStatusBar.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo)

	Local $hStatus = _MemoCreateOutProcess($hWin, "msctls_statusbar32", 0, $sFromTo)

	Local $iPart = 0
	_GUICtrlStatusBar_SetText($hStatus, "UPD 0", $iPart) ; update the external Process StatusBar part 0

	_MemoWrite(@CRLF & "=====================" & @CRLF & "StatusBar info displayed" & $sFromTo & " External process" & @CRLF & "=====================")
	; Show part text
	_MemoWrite("Part " & $iPart & " text ........: " & _GUICtrlStatusBar_GetText($hStatus, $iPart))
	_MemoWrite("Parts count ........: " & _GUICtrlStatusBar_GetCount($hStatus))
	Local $aParts = _GUICtrlStatusBar_GetParts($hStatus)
	For $iI = 0 To $aParts[0] - 1
		_MemoWrite("Part " & $iI & " width .: " & _GUICtrlStatusBar_GetWidth($hStatus, $iI) & " (" & $aParts[$iI + 1] & ")")
	Next

	_MemoWrite(@CRLF & "=====================")

	_MemoMsgBoxStatus("", Default, $hWin) ; no more action, wait GUI for closing, close also OutProcess GUI

EndFunc   ;==>Example
