; == Example 1 : Created with Native AutoIt functions

#include "Extras\HelpFileInternals.au3"
#include "Extras\WM_NOTIFY.au3"

#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	; Create GUI
	local $hGUI = GUICreate("Tab ActivateTab (v" & @AutoItVersion & ")", 450, 300, 100, 100)
	Local $idTab = GUICtrlCreateTab(2, 2, 446, 266)
	_MemoMsgBoxStatus() ; Status creation

	GUISetState(@SW_SHOW)

	; Add tabs
	GUICtrlCreateTabItem("Tab 0")
	GUICtrlCreateTabItem("Tab 1")
	GUICtrlCreateTabItem("Tab 2")

	_GUICtrlTab_ActivateTab($idTab, 1)
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Tab 1 is activated")
	_GUICtrlTab_ActivateTab($idTab, 3)
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Tab 3 does not exist")

	_MemoMsgBoxStatus("", -1, $hGUI) ; no more action, wait GUI for closing

EndFunc   ;==>Example
