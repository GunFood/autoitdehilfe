#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hImage, $idListView

	GUICreate("ListView: Ermittelt die erweiterten ListView Stile", 420, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	_GUICtrlListView_SetExtendedListViewStyle($idListView, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_SUBITEMIMAGES))
	GUISetState(@SW_SHOW)

	; Lädt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($idListView), 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($idListView), 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($idListView), 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($idListView, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($idListView, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($idListView, "Spalte 3", 100)

	_GUICtrlListView_InsertItem($idListView, "Zeile 1: Spalte 1", -1, 0)
	_GUICtrlListView_AddSubItem($idListView, 0, "Zeile 1: Spalte 2", 1, 1)
	_GUICtrlListView_AddSubItem($idListView, 0, "Zeile 1: Spalte 3", 2, 2)
	_GUICtrlListView_InsertItem($idListView, "Zeile 2: Spalte 1", -1, 1)
	_GUICtrlListView_AddSubItem($idListView, 1, "Zeile 2: Spalte 2", 1, 2)
	_GUICtrlListView_InsertItem($idListView, "Zeile 3: Spalte 1", -1, 2)

	MsgBox($MB_SYSTEMMODAL, "Information", "Erweiterten ListView Stile: 0x" & _GUICtrlListView_GetExtendedListViewStyle($idListView) & @CRLF & _
			_DisplayExtendStringList($idListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func _DisplayExtendStringList($idListView)
	Local $sStyles = @CRLF & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_BORDERSELECT) = $LVS_EX_BORDERSELECT) Then $sStyles &= "$LVS_EX_BORDERSELECT" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_CHECKBOXES) = $LVS_EX_CHECKBOXES) Then $sStyles &= "$LVS_EX_CHECKBOXES" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_DOUBLEBUFFER) = $LVS_EX_DOUBLEBUFFER) Then $sStyles &= "$LVS_EX_DOUBLEBUFFER" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_FLATSB) = $LVS_EX_FLATSB) Then $sStyles &= "$LVS_EX_FLATSB" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_FULLROWSELECT) = $LVS_EX_FULLROWSELECT) Then $sStyles &= "$LVS_EX_FULLROWSELECT" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_GRIDLINES) = $LVS_EX_GRIDLINES) Then $sStyles &= "$LVS_EX_GRIDLINES" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_HEADERDRAGDROP) = $LVS_EX_HEADERDRAGDROP) Then $sStyles &= "$LVS_EX_HEADERDRAGDROP" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_INFOTIP) = $LVS_EX_INFOTIP) Then $sStyles &= "$LVS_EX_INFOTIP" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_LABELTIP) = $LVS_EX_LABELTIP) Then $sStyles &= "$LVS_EX_LABELTIP" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_MULTIWORKAREAS) = $LVS_EX_MULTIWORKAREAS) Then $sStyles &= "$LVS_EX_MULTIWORKAREAS" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_ONECLICKACTIVATE) = $LVS_EX_ONECLICKACTIVATE) Then $sStyles &= "$LVS_EX_ONECLICKACTIVATE" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_REGIONAL) = $LVS_EX_REGIONAL) Then $sStyles &= "$LVS_EX_REGIONAL" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_SIMPLESELECT) = $LVS_EX_SIMPLESELECT) Then $sStyles &= "$LVS_EX_SIMPLESELECT" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_SUBITEMIMAGES) = $LVS_EX_SUBITEMIMAGES) Then $sStyles &= "$LVS_EX_SUBITEMIMAGES" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_TRACKSELECT) = $LVS_EX_TRACKSELECT) Then $sStyles &= "$LVS_EX_TRACKSELECT" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_TWOCLICKACTIVATE) = $LVS_EX_TWOCLICKACTIVATE) Then $sStyles &= "$LVS_EX_TWOCLICKACTIVATE" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_UNDERLINECOLD) = $LVS_EX_UNDERLINECOLD) Then $sStyles &= "$LVS_EX_UNDERLINECOLD" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($idListView), $LVS_EX_UNDERLINEHOT) = $LVS_EX_UNDERLINEHOT) Then $sStyles &= "$LVS_EX_UNDERLINEHOT" & @CRLF & @TAB
	Return $sStyles
EndFunc   ;==>_DisplayExtendStringList
