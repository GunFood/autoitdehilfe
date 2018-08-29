#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $tRECT, $idListView

	GUICreate("ListView: Ermittelt das begrenzende Rechteck", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListView, "Item 1")
	_GUICtrlListView_AddItem($idListView, "Item 2")
	_GUICtrlListView_AddItem($idListView, "Item 3")

	; Ermittelt das begrenzende Rechteck für Item 2
	$tRECT = _GUICtrlListView_GetItemRectEx($idListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Rechteck für Item 2 : [%d, %d, %d, %d]", DllStructGetData($tRECT, "Left"), _
			DllStructGetData($tRECT, "Top"), DllStructGetData($tRECT, "Right"), DllStructGetData($tRECT, "Bottom")))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
