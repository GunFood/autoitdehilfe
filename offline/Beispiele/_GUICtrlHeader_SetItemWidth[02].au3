; == Example 2 : Header Set ItemWidth to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiHeader.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True) ; OK also if run in different mode

	Local $hHeader = _MemoCreateOutProcess($hWin, "SysHeader32", 1, $sFromTo)

	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "About to set item width")

	; Set column 0 param
	_GUICtrlHeader_SetItemWidth($hHeader, 0, 100)

	; Show column 0 param
	_MemoWrite("Column 0 width: " & _GUICtrlHeader_GetItemWidth($hHeader, 0))

	_MemoMsgBoxStatus("", Default, $hWin) ; no more action, wait GUI for closing

EndFunc   ;==>Example
