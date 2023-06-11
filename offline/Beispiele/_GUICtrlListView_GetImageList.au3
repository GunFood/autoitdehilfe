#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Setzt und ermittelt die Imagelist (v" & @AutoItVersion & ")", 500, 300)
	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Lädt die Bilder
	Local $hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListview, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListview, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($idListview, 0x0000FF, 16, 16))
	Local $hPrevImageList = _GUICtrlListView_SetImageList($idListview, $hImage, 1)

	MsgBox($MB_SYSTEMMODAL, "Information", "Vorheriges Handle der Imagelist: 0x" & Hex($hPrevImageList) & @CRLF & _
			"IsPtr = " & IsPtr($hPrevImageList) & " IsHWnd = " & IsHWnd($hPrevImageList))

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Spalte 0", 100)
	_GUICtrlListView_AddColumn($idListview, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($idListview, "Spalte 2", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListview, "Item 0", 0)
	_GUICtrlListView_AddItem($idListview, "Item 1", 1)
	_GUICtrlListView_AddItem($idListview, "Item 2", 2)

	; Ermittelt das Handle der Imagelist
	MsgBox($MB_SYSTEMMODAL, "Information", "Handle der Imagelist: 0x" & Hex(_GUICtrlListView_GetImageList($idListview, 1)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
