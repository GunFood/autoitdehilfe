; == Example 2 : StatusBar Get/Set Tip Text to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiStatusBar.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo)

	Local $hStatus = _MemoCreateOutProcess($hWin, "msctls_statusbar32", 0, $sFromTo)

	Local $iPart = 0
	_GUICtrlStatusBar_SetTipText($hStatus, $iPart, "UPD 0") ; update the external Process StatusBar part 0

	_MemoWrite(@CRLF & "=====================" & @CRLF & "StatusBar info displayed" & $sFromTo & " External process" & @CRLF & "=====================")
	; Show part text
	_MemoWrite("Part " & $iPart & " TipText ........: " & _GUICtrlStatusBar_GetTipText($hStatus, $iPart))

	_MemoWrite(@CRLF & "=====================")

	_MemoMsgBoxStatus("", Default, $hWin) ; no more action, wait GUI for closing, close also OutProcess GUI

EndFunc   ;==>Example
