; == Example 2 : Header Set ItemParam to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiHeader.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True) ; OK also if run in different mode

	Local $hHeader = _MemoCreateOutProcess($hWin, "SysHeader32", 1, $sFromTo)

	; Set column 0 param
	_GUICtrlHeader_SetItemParam($hHeader, 0, 4321)

	; Show column 0 param
	_MemoWrite("Column 0 param: " & _GUICtrlHeader_GetItemParam($hHeader, 0))

	_MemoMsgBoxStatus("", -1, $hWin) ; no more action, wait GUI for closing

EndFunc   ;==>Example
