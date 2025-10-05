; == Example 2 : StatusBar Destroy to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiStatusBar.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True, "_GUICtrlStatusBar_Create")

	Local $hStatus = _MemoCreateOutProcess($hWin, "msctls_statusbar32", 0, $sFromTo)

	_GUICtrlStatusBar_Destroy($hStatus)
	If @error Then _MemoWrite("_GUICtrlStatusBar_Destroy()" & " @error = " & @error & @CRLF & _
			@TAB & "cannot be retrieved by an external process")

	_MemoMsgBoxStatus("", Default, $hWin) ; no more action, wait GUI for closing, close also OutProcess GUI

EndFunc   ;==>Example
