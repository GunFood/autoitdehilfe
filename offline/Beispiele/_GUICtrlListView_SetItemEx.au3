#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $tText, $tItem, $idListView

	GUICreate("ListView: Setzt die Attribute eines Items", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	; Fügt die Items hinzu
	GUICtrlCreateListViewItem("Item 1", $idListView)
	GUICtrlCreateListViewItem("Item 2", $idListView)
	GUICtrlCreateListViewItem("Item 3", $idListView)

	; Ändert Item 2
	MsgBox($MB_SYSTEMMODAL, "Information", "Ändert Item 2")
	$tText = DllStructCreate("wchar Text[13]")
	$tItem = DllStructCreate($tagLVITEM)
	DllStructSetData($tText, "Text", "Neues Item 2")
	DllStructSetData($tItem, "Mask", $LVIF_TEXT)
	DllStructSetData($tItem, "Item", 1)
	DllStructSetData($tItem, "Text", DllStructGetPtr($tText))
	_GUICtrlListView_SetItemEx($idListView, $tItem)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
