; == Example (OutProcess) : Tab HitTest to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, False) ; OK also if running in diffent mode
	Local $hTabCtrl = _MemoCreateOutProcess($hWin, "SysTabControl32", 1, $sFromTo)

	Local $aHit = _GUICtrlTab_HitTest($hTabCtrl, 100, 10)
	_MemoMsgBox($MB_SYSTEMMODAL, "Info" & $sFromTo, "Point [100,10] is over tab " & $aHit[0])

	_MemoMsgBoxStatus("", -1, $hWin) ; no more action, wait GUI for closing

EndFunc   ;==>Example
