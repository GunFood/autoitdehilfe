; == Example 2 : Header Get/Set Item Text to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiHeader.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo) ; OK if run in different Mode

	Local $hHeader = _MemoCreateOutProcess($hWin, "SysHeader32", 0, $sFromTo)

	; Set column 1 text
	_GUICtrlHeader_SetItemText($hHeader, 1, "<<<Column Y")
	_MemoWrite("<<< Column 1 text: " & _GUICtrlHeader_GetItemText($hHeader, 1))

	_MemoMsgBoxStatus("", -1, $hWin) ; no more action, wait GUI for closing

EndFunc   ;==>Example
