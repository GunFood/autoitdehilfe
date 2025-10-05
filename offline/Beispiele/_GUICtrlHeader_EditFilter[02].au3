; == Example 2 : Header Edit/Get EditFilter to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiHeader.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True)

	Local $hHeader = _MemoCreateOutProcess($hWin, "SysHeader32", 3, $sFromTo)

	_MemoWrite("<<< Start Edit Filter 2" & @CRLF)

	_GUICtrlHeader_EditFilter($hHeader, 2)
	Send("<<< Filter 2")
	Send("{ENTER}")
	_MemoWrite("Filter 2 Changed" & @CRLF)

	_GUICtrlHeader_GetFilterText($hHeader, 2)
	If @error Then _MemoWrite("_GUICtrlHeader_GetFilterText()" & " @error = " & @error & @CRLF & _
			@TAB & "cannot be retrieved by an external process")

	_MemoMsgBoxStatus("", Default, $hWin) ; no more action, wait GUI for closing, close also OutProcess GUI

EndFunc   ;==>Example
