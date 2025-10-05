; == Example 2 : Header Destroy to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiHeader.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True, "_GUICtrlHeader_Create")

	Local $hHeader = _MemoCreateOutProcess($hWin, "SysHeader32", 0, $sFromTo)

	_GUICtrlHeader_Destroy($hHeader)
	If @error Then _MemoWrite("_GUICtrlHeader_Destroy()" & " @error = " & @error & @CRLF & _
			@TAB & "cannot be retrieved by an external process")

	_MemoMsgBoxStatus("", Default, $hWin) ; no more action, wait GUI for closing, close also OutProcess GUI

EndFunc   ;==>Example
