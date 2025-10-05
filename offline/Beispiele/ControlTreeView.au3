#include <GUIConstantsEx.au3>
#include <TreeViewConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGui = GUICreate("ControlTreeView Beispiel", 212, 212)
	Local $idTreeView_1 = GUICtrlCreateTreeView(6, 6, 200, 160, BitOR($TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_CHECKBOXES), $WS_EX_CLIENTEDGE)
	Local $hTreeView_1 = ControlGetHandle($hGui, "", $idTreeView_1)

	Local $idTVi_Root = GUICtrlCreateTreeViewItem("Root", $idTreeView_1)
	GUICtrlCreateTreeViewItem("Item 1", $idTVi_Root)
	GUICtrlCreateTreeViewItem("Item 2", $idTVi_Root)
	GUICtrlCreateTreeViewItem("Item 3", $idTVi_Root)
	Local $idTVi_Item_4 = GUICtrlCreateTreeViewItem("Item 4", $idTVi_Root)
	GUICtrlCreateTreeViewItem("Item 4.1", $idTVi_Item_4)
	GUICtrlCreateTreeViewItem("Item 4.2", $idTVi_Item_4)
	GUICtrlCreateTreeViewItem("Item 5", $idTVi_Root)

	GUISetState(@SW_SHOW, $hGui)

	ControlTreeView($hGui, "", $hTreeView_1, "Expand", "Root")

	ControlTreeView($hGui, "", $hTreeView_1, "Exists", "Root|Item 4")
	ControlTreeView($hGui, "", $hTreeView_1, "Check", "Root|Item 4")
	ControlTreeView($hGui, "", $hTreeView_1, "Select", "Root|Item 4")
	ControlTreeView($hGui, "", $hTreeView_1, "Expand", "Root|Item 4")

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	GUIDelete($hGui)
EndFunc   ;==>Example
