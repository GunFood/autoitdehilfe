#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Setzt und ermittelt die Attribute eines Items (v" & @AutoItVersion & ")", 600, 300)
	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($idListview, False)

	; Fügt Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Items", 150)

	GUICtrlCreateListViewItem("Item 0", $idListview)
	GUICtrlCreateListViewItem("Item 1", $idListview)
	GUICtrlCreateListViewItem("Item 2", $idListview)

	; Zeigt den Status von Item 2
	Local $tItem = DllStructCreate($tagLVITEM)
	DllStructSetData($tItem, "Mask", $LVIF_STATE)
	DllStructSetData($tItem, "Item", 1)
	DllStructSetData($tItem, "StateMask", -1)
	_GUICtrlListView_GetItemEx($idListview, $tItem)
	MsgBox($MB_SYSTEMMODAL, "Information", "Status von Item 1: " & DllStructGetData($tItem, "State"))

	; Wählt Item 2 aus
	_GUICtrlListView_SetItemSelected($idListview, 1)

	; Ändert Item 1
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 1 wird geändert")
	Local $tText
	If _GUICtrlListView_GetUnicodeFormat($idListview) Then
		$tText = DllStructCreate("wchar Text[11]")
	Else
		$tText = DllStructCreate("char Text[11]")
	EndIf
	$tItem = DllStructCreate($tagLVITEM)
	DllStructSetData($tText, "Text", "Neues Item 1")
	DllStructSetData($tItem, "Mask", $LVIF_TEXT)
	DllStructSetData($tItem, "Item", 1)
	DllStructSetData($tItem, "Text", DllStructGetPtr($tText))
	_GUICtrlListView_SetItemEx($idListview, $tItem)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
