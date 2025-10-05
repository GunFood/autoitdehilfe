; == Example 2 : Header Set OrderArray to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiHeader.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo) ; OK if run in different Mode

	Local $hHeader = _MemoCreateOutProcess($hWin, "SysHeader32", 0, $sFromTo)

	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "About to Order the header")

	; Set order array
	Local $aOrder[5] = [4, 0, 1, 2, 3]
	_GUICtrlHeader_SetOrderArray($hHeader, $aOrder)

	; Show order array
	$aOrder = _GUICtrlHeader_GetOrderArray($hHeader)
	For $iI = 1 To $aOrder[0]
		_MemoWrite("Index: " & $iI - 1 & ", Order: " & $aOrder[$iI] & ' (' & _GUICtrlHeader_GetItemText($hHeader, $iI - 1) & ')')
	Next

	_MemoMsgBoxStatus("", -1, $hWin) ; no more action, wait GUI for closing

EndFunc   ;==>Example
