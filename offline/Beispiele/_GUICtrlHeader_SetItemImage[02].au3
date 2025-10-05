; == Example 2 : Header Set ItemImage to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiHeader.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True) ; OK also if run in different mode

	Local $hHeader = _MemoCreateOutProcess($hWin, "SysHeader32", 1, $sFromTo)

	; Show column 0 image
	_MemoWrite(">>> Column 0 image: " & _GUICtrlHeader_GetItemImage($hHeader, 0))

	; Set column 0 image
	_GUICtrlHeader_SetItemImage($hHeader, 0, 1)
	If @error Then
		_MemoWrite("_GUICtrlHeader_SetItemImage()" & " @error = " & @error & @CRLF & _
			@TAB & "cannot be set by an external process")

	EndIf

	_MemoMsgBoxStatus("", -1, $hWin) ; no more action, wait GUI for closing

EndFunc   ;==>Example
