; == Example (OutProcess) : Tab Get/Set Item to an External process

#include "Extras\HelpFileInternals.au3"

#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sFromTo
	Local $hWin = _MemoRunAU3OutProcess($sFromTo, True) ; OK also if run in different mode
	Local $hTabCtrl = _MemoCreateOutProcess($hWin, "SysTabControl32", 0, $sFromTo)

	Local $iTab = 2
	_MemoMsgBox($MB_SYSTEMMODAL, "Info" & $sFromTo, "Set Item #" & $iTab)
	_GUICtrlTab_SetItem($hTabCtrl, $iTab, "UPD Text") ; update the external Process Tab
	Local $aItem = _GUICtrlTab_GetItem($hTabCtrl, $iTab)
	_MemoWrite(@CRLF & "=====================")
	_MemoWrite("Tab Item " & $iTab)
	_MemoWrite("=====================")
	If IsArray($aItem) Then
		For $y = 0 To 3
			_MemoWrite("$aItem[" & $y & "]: " & $aItem[$y])
		Next
	Else
		_MemoWrite("$aItem: " & $aItem)
	Endif

	; to force refreshing of the Edit OutProcess
	WinSetState($hWin, "", @SW_MINIMIZE)
	WinSetState($hWin, "", @SW_RESTORE)

	_MemoMsgBoxStatus("", -1, $hWin) ; no more action, wait GUI for closing

EndFunc   ;==>Example
