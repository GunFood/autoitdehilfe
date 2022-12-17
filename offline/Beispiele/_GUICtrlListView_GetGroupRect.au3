#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Ermittelt das Rechteck für die festgelegte Gruppe (v" & @AutoItVersion & ")", 600, 300)

	Local $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)

	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($idListview, False)

	; Lädt die Bilder
	Local $hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($idListview), 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($idListview), 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($idListview), 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($idListview, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Spalte 1", 120)
	_GUICtrlListView_AddColumn($idListview, "Spalte 2", 120)
	_GUICtrlListView_AddColumn($idListview, "Spalte 3", 120)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($idListview, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($idListview, 0, "Zeile 1: Spalte 2", 1)
	_GUICtrlListView_AddSubItem($idListview, 0, "Zeile 1: Spalte 3", 2)
	_GUICtrlListView_AddItem($idListview, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($idListview, 1, "Zeile 2: Spalte 2", 1)
	_GUICtrlListView_AddItem($idListview, "Zeile 3: Spalte 1", 2)

	; Gruppen erzeugen
	_GUICtrlListView_EnableGroupView($idListview)
	_GUICtrlListView_InsertGroup($idListview, -1, 1, "Gruppe 1", 1)
	_GUICtrlListView_InsertGroup($idListview, -1, 2, "Gruppe 2")
	_GUICtrlListView_SetItemGroupID($idListview, 0, 1)
	_GUICtrlListView_SetItemGroupID($idListview, 1, 2)
	_GUICtrlListView_SetItemGroupID($idListview, 2, 2)

	; Ermittelt das Rechteck der Gruppen ID 2
	Local $aInfo = _GUICtrlListView_GetGroupRect($idListview, 2)
	MsgBox($MB_SYSTEMMODAL, "Information", "Rechteck: " & @CRLF & _
			@TAB & "Links...: " & $aInfo[0] & @CRLF & _
			@TAB & "Oben...: " & $aInfo[1] & @CRLF & _
			@TAB & "Rechts.: " & $aInfo[2] & @CRLF & _
			@TAB & "Unten..: " & $aInfo[3])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
