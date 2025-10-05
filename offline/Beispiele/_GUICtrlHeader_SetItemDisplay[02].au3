; == Example 2 : Header Set ItemDisplay to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiHeader.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo)

	Local $hHeader = _MemoCreateOutProcess($hWin, "SysHeader32", 0, $sFromTo)

	; Show column 0 display
	_MemoWrite("Column 1 display: 0x" & Hex(_GUICtrlHeader_GetItemDisplay($hHeader, 1)))

	; Set column 0 display
	_GUICtrlHeader_SetItemDisplay($hHeader, 0, 1 + 8) ; Bitmap(1) + String(8) on left

	_MemoMsgBoxStatus("", -1, $hWin) ; no more action, wait GUI for closing

EndFunc   ;==>Example
