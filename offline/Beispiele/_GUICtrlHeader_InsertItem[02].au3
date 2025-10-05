; == Example 2 : Header Insert Item to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiHeader.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, False) ; OK if run in different Mode

	Local $hHeader = _MemoCreateOutProcess($hWin, "SysHeader32", 0, $sFromTo)

	_GUICtrlHeader_InsertItem($hHeader, 2, "<<<Column Y", 100, 2, 2)
	_MemoWrite("Column #2 changed to <<<Column Y")

	_MemoMsgBoxStatus("", -1, $hWin) ; no more action, wait GUI for closing

EndFunc   ;==>Example
