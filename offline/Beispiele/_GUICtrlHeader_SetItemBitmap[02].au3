; == Example 2 : Header Set ItemBitMap to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiHeader.au3>
#include <WinAPIGdi.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True)

	Local $hHeader = _MemoCreateOutProcess($hWin, "SysHeader32", 0, $sFromTo)

	; Show column 3 bitmap handle
	_MemoWrite("Column 3 bitmap handle: " & Ptr(_GUICtrlHeader_GetItemBitmap($hHeader, 3)))

	; Set column 3 bitmap
	_GUICtrlHeader_SetItemBitmap($hHeader, 3, _WinAPI_CreateSolidBitmap($hWin, 0xFFFF00, 11, 11))
	If @error Then
		_MemoWrite("_GUICtrlHeader_SetItemBitmap()" & " @error = " & @error & @CRLF & _
			@TAB & "cannot be set by an external process")
	EndIf

	_MemoMsgBoxStatus("", -1, $hWin) ; no more action, wait GUI for closing

EndFunc   ;==>Example
