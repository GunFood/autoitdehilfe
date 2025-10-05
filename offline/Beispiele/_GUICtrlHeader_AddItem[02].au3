; == Example 2 : Header Add Item to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiHeader.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True)

	Local $hHeader = _MemoCreateOutProcess($hWin, "SysHeader32", 3, $sFromTo)

	_GUICtrlHeader_AddItem($hHeader, "<<<Column 5", 75)

	; Show column count
	_MemoWrite("Column count: " & _GUICtrlHeader_GetItemCount($hHeader))

	_MemoMsgBoxStatus("", Default, $hWin) ; no more action, wait GUI for closing, close also OutProcess GUI

EndFunc   ;==>Example
