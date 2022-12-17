#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Sucht ein Item (v" & @AutoItVersion & ")", 400, 300)
	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($idListview, False)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_BeginUpdate($idListview)
	Local $iI
	For $iI = 1 To 100
		_GUICtrlListView_AddItem($idListview, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($idListview)

	; Setzt für Item 50 einen Parameterwert
	_GUICtrlListView_SetItemParam($idListview, 49, 1234)

	; Suche nach Zielitem
	Local $tInfo = DllStructCreate($tagLVFINDINFO)
	DllStructSetData($tInfo, "Flags", $LVFI_PARAM)
	DllStructSetData($tInfo, "Parameter", 1234)
	$iI = _GUICtrlListView_FindItem($idListview, -1, $tInfo)
	MsgBox($MB_SYSTEMMODAL, "Information", "Zielitemindex: " & $iI)
	_GUICtrlListView_EnsureVisible($idListview, $iI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
