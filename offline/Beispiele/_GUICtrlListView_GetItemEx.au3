#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $tItem, $idListView

	GUICreate("ListView: Ermittelt die Attribute eines Items", 400, 300)

	$idListView = GUICtrlCreateListView("Items", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	GUICtrlCreateListViewItem("Item 1", $idListView)
	GUICtrlCreateListViewItem("Item 2", $idListView)
	GUICtrlCreateListViewItem("Item 3", $idListView)

	; Zeigt den Status von Item 2
	$tItem = DllStructCreate($tagLVITEM)
	DllStructSetData($tItem, "Mask", $LVIF_STATE)
	DllStructSetData($tItem, "Item", 1)
	DllStructSetData($tItem, "StateMask", -1)
	_GUICtrlListView_GetItemEx($idListView, $tItem)
	MsgBox($MB_SYSTEMMODAL, "Information", "Status von Item 2: " & DllStructGetData($tItem, "State"))

	; Wählt Item 2 aus
	_GUICtrlListView_SetItemSelected($idListView, 1)

	; Zeigt den Status von Item 2
	_GUICtrlListView_GetItemEx($idListView, $tItem)
	MsgBox($MB_SYSTEMMODAL, "Information", "Status von Item 2: " & DllStructGetData($tItem, "State"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
