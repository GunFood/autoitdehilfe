; == Example (OutProcess) : Tab Insert Item to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiTab.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, False) ; OK also if running in deifferent mode
	Local $hTabCtrl = _MemoCreateOutProcess($hWin, "SysTabControl32", 1, $sFromTo)

	_GUICtrlTab_InsertItem($hTabCtrl, 2, "<<<Tab 4")
	_MemoMsgBox($MB_SYSTEMMODAL, "Info" & $sFromTo, "Insert item #2")

	_MemoMsgBoxStatus("", -1, $hWin) ; no more action, wait GUI for closing

EndFunc   ;==>Example
