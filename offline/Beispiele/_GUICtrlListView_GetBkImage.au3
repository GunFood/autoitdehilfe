#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example_UDF_Created() ; verwendet Listview-UDF

Func Example_UDF_Created()
	Local $iStylesEx = BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_DOUBLEBUFFER)

	Local $hGUI = GUICreate("(UDF) ListView: Setzt das Hintergrundbild (v" & @AutoItVersion & ")", 600, 550)
	Local $hListView = _GUICtrlListView_Create($hGUI, "", 2, 2, 596, 500, -1, -1, True)     ; Der letzte Parameter führt zum Aufruf von CoInitializeEx
	_GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_DOUBLEBUFFER))

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($hListView, False)

	; Lädt die Bilder
	Local $hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($hListView, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_InsertColumn($hListView, 0, "Spalte 1", 120)
	_GUICtrlListView_InsertColumn($hListView, 1, "Spalte 2", 120)
	_GUICtrlListView_InsertColumn($hListView, 2, "Spalte 3", 120)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($hListView, 0, "Zeile 1: Spalte 2", 1)
	_GUICtrlListView_AddSubItem($hListView, 0, "Zeile 1: Spalte 3", 2)
	_GUICtrlListView_AddItem($hListView, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($hListView, 1, "Zeile 2: Spalte 2", 1)
	_GUICtrlListView_AddItem($hListView, "Zeile 3: Spalte 1", 2)

	; Bildet Gruppen
	_GUICtrlListView_EnableGroupView($hListView)
	_GUICtrlListView_InsertGroup($hListView, -1, 1, "Gruppe 1")
	_GUICtrlListView_InsertGroup($hListView, -1, 2, "Gruppe 2")
	_GUICtrlListView_SetItemGroupID($hListView, 0, 1)
	_GUICtrlListView_SetItemGroupID($hListView, 1, 2)
	_GUICtrlListView_SetItemGroupID($hListView, 2, 2)

	; Lädt ein Bild herunter
	Local $sURL = "http://www.autoitscript.com/autoit3/files/graphics/autoit9_wall_grey_800x600.jpg"
	Local $sFilePath = @ScriptDir & "\AutoIt.jpg"
	InetGet($sURL, $sFilePath)

	; Setzt das Hintergrundbild
	_GUICtrlListView_SetBkImage($hListView, $sFilePath)
	Local $aImage = _GUICtrlListView_GetBkImage($hListView)

	GUISetState(@SW_SHOW)
	MsgBox($MB_SYSTEMMODAL, "Information", "Hintergrundbild: " & @CRLF & $aImage[1])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	DllCall('ole32.dll', 'long', 'OleUninitialize')     ; Muss für jeden Aufruf von CoInitializeEx ausgeführt werden

	GUIDelete()
	FileDelete($sFilePath)
EndFunc   ;==>Example_UDF_Created
