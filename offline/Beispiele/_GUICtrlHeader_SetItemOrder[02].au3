; == Example 2 : Header Set ItemOrder to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiHeader.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo) ; OK also if run in different mode

	Local $hHeader = _MemoCreateOutProcess($hWin, "SysHeader32", 1, $sFromTo)

	; Set column 1 order
	_GUICtrlHeader_SetItemOrder($hHeader, 0, 2)

	; Show column 0 order
	_MemoWrite("<<< Column 0 order: " & _GUICtrlHeader_GetItemOrder($hHeader, 0))

	_MemoMsgBoxStatus("", -1, $hWin) ; no more action, wait GUI for closing

EndFunc   ;==>Example
