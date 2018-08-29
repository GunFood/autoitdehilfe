#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hImage, $idListView

	GUICreate("ListView: Ermittelt den inkrementellen Suchstring", 420, 300)

	$idListView = GUICtrlCreateListView("", 2, 2, 414, 268)
	GUICtrlSetStyle($idListView, $LVS_ICON)
	GUISetState(@SW_SHOW)

	; Lädt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListView, 0xFF0000, 16, 16))
	_GUICtrlListView_SetImageList($idListView, $hImage, 0)

	_GUICtrlListView_BeginUpdate($idListView)
	For $x = 1 To 10
		_GUICtrlListView_InsertItem($idListView, "Item " & $x, -1, 0)
	Next
	_GUICtrlListView_EndUpdate($idListView)

	Send("Item 3")

	; Ermittelt den inkrementellen Suchstring
	MsgBox(8256, "Information", "Inkrementeller Suchstring: " & _GUICtrlListView_GetISearchString($idListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
