#Region    ;************ Includes ************
#include <GuiConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#EndRegion ;************ Includes ************

Opt('MustDeclareVars', 1)

_Main()

Func _Main()
	Local $listview, $hImage
	Local $sPath = RegRead("HKEY_LOCAL_MACHINESOFTWAREAutoIt v3AutoIt", "InstallDir") & "Examples\GUI\Advanced\Images\"

	GUICreate("Imagelist: AddBitmap", 400, 300)
	$listview = GUICtrlCreateListView("", 2, 2, 394, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER))
	GUISetState()

	; L&auml;dt die Bilder
	$hImage = _GUIImageList_Create(16, 32)
	_GUIImageList_AddBitmap($hImage, $sPath & "Red.bmp")
	_GUIImageList_AddBitmap($hImage, $sPath & "Green.bmp")
	_GUIImageList_AddBitmap($hImage, $sPath & "Blue.bmp")
	_GUICtrlListView_SetImageList($listview, $hImage, 1)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($listview, "Items", 120)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($listview, "Item 1", 0)
	_GUICtrlListView_AddItem($listview, "Item 2", 1)
	_GUICtrlListView_AddItem($listview, "Item 3", 2)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
