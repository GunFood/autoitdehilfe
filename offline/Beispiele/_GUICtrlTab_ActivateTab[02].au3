; == Example (OutProcess) : Tab ActivateTab to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True) ; OK also if running in different mode
	Local $hTabCtrl = _MemoCreateOutProcess($hWin, "SysTabControl32", 2, $sFromTo)

	_GUICtrlTab_ActivateTab($hTabCtrl, 2)
	_MemoMsgBox($MB_SYSTEMMODAL, "Info" & $sFromTo, "Tab 2 is activated")

	_MemoMsgBoxStatus("", Default, $hWin) ; no more action, wait GUI for closing

EndFunc   ;==>Example
