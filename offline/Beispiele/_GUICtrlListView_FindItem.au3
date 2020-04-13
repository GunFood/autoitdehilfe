#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $tInfo, $iI, $idListView

	GUICreate("ListView: Sucht ein Item", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_BeginUpdate($idListView)
	For $iI = 1 To 100
		_GUICtrlListView_AddItem($idListView, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($idListView)

	; Setzt für Item 50 einen Parameterwert
	_GUICtrlListView_SetItemParam($idListView, 49, 1234)

	; Suche nach Zielitem
	$tInfo = DllStructCreate($tagLVFINDINFO)
	DllStructSetData($tInfo, "Flags", $LVFI_PARAM)
	DllStructSetData($tInfo, "Parameter", 1234)
	$iI = _GUICtrlListView_FindItem($idListView, -1, $tInfo)
	MsgBox($MB_SYSTEMMODAL, "Information", "Zielitemindex: " & $iI)
	_GUICtrlListView_EnsureVisible($idListView, $iI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
