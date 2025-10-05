; == Example (OutProcess) : Tab Get Display RectEx to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True) ; OK also if running in different mode
	Local $hTabCtrl = _MemoCreateOutProcess($hWin, "SysTabControl32", 1, $sFromTo)

	Local $tRECT = _GUICtrlTab_GetDisplayRectEx($hTabCtrl)
	Local $sRect = StringFormat("[%d, %d, %d, %d]", DllStructGetData($tRECT, "Left"), _
			DllStructGetData($tRECT, "Top"), _
			DllStructGetData($tRECT, "Right"), _
			DllStructGetData($tRECT, "Bottom"))
	_MemoMsgBox($MB_SYSTEMMODAL, "Info" & $sFromTo, "Display rectangle: " & $sRect)

	_MemoMsgBoxStatus("", -1, $hWin) ; no more action, wait GUI for closing, close also OutProcess GUI

EndFunc   ;==>Example
