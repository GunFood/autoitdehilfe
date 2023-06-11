#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("ListView: Ermittelt Gruppeninformationen (v" & @AutoItVersion & ")", 500, 300)

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

	; Gruppen erstellen
	_GUICtrlListView_EnableGroupView($idListview)
	_GUICtrlListView_InsertGroup($idListview, -1, 1, "Gruppe 1", 1)
	_GUICtrlListView_InsertGroup($idListview, -1, 2, "Gruppe 2")
	_GUICtrlListView_SetItemGroupID($idListview, 0, 1)
	_GUICtrlListView_SetItemGroupID($idListview, 1, 2)
	_GUICtrlListView_SetItemGroupID($idListview, 2, 2)

	If @OSVersion = "WIN_XP" Then
		MsgBox($MB_SYSTEMMODAL, "Information", "Diese Funktion funktioniert nicht unter WinXP")
	Else
		; Ändert Gruppeninformationen
		Local $aInfo
		For $x = 0 To _GUICtrlListView_GetGroupCount($idListview) - 1
			$aInfo = _GUICtrlListView_GetGroupInfoByIndex($idListview, $x)
			MsgBox($MB_SYSTEMMODAL, "Information", "Index " & $x + 1 & "Text: " & $aInfo[0])
		Next
	EndIf
	_GUICtrlListView_SetGroupInfo($idListview, 1, "Neue Gruppe 1")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example
