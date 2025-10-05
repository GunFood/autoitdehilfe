; == Example 2 : Header Set ItemFormat to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiHeader.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, False) ; OK if run in different mode

	Local $hHeader = _MemoCreateOutProcess($hWin, "SysHeader32", 0, $sFromTo)

	; Set column 0 format
	_GUICtrlHeader_SetItemFormat($hHeader, 0, BitOR($HDF_CENTER, $HDF_STRING))

	; Show column 0 format
	_MemoWrite("Column 0 format: " & "0x" & Hex(_GUICtrlHeader_GetItemFormat($hHeader, 0)))

	_MemoMsgBoxStatus("", -1, $hWin) ; no more action, wait GUI for closing

EndFunc   ;==>Example
