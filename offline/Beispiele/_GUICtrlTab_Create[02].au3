; == Example (OutProcess) : Tab Create to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, False)
	_MemoCreateOutProcess($hWin, "SysTabControl32", 2, $sFromTo)

	_GUICtrlTab_Create($hWin, 2, 2, 446, 266)

	If @error Then _MemoMsgBox($MB_ICONERROR, "Info" & $sFromTo, "@error=" & @error & " _GUICtrlTab_Create()" & @CRLF & @TAB & "cannot be used for an external process")

	_MemoMsgBoxStatus("", -1, $hWin) ; no more action, wait GUI for closing

EndFunc   ;==>Example
