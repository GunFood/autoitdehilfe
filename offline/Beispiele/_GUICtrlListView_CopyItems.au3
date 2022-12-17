#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <WindowsConstants.au3>

Opt("GUIOnEventMode", 1)

Global $g_hListView, $g_hListView2, $g_hGUI1, $g_hGUI2, $g_iRun = 1
Global $g_iDock = 1, $g_iDock_Location = 1, $g_iX1, $g_iX2, $g_iY1, $g_iY2
Global $idOptionsItem2, $idOptionsItem3, $idOptionsItem4
Global $g_idOptions2Item2, $g_idOptions2Item3, $g_idOptions2Item4

Example()

Func Example()
	$g_iRun = 1
	Local $idOptionsMenu, $idOptionsItem1, $idOptions2Menu, $idOptions2Item1, $iWidth = 450
	Local $id_MoveLeft, $id_MoveRight, $id_Exit1, $id_Exit2
	Local $id_CopyRight, $id_CopyLeft, $hImage
	Local $iStylesEx = BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_CHECKBOXES, $LVS_EX_SUBITEMIMAGES)

	$g_hGUI1 = GUICreate("(extern) ListView: Items kopieren (v" & @AutoItVersion & ")", $iWidth, 400, 10, 10)
	$idOptionsMenu = GUICtrlCreateMenu("Optionen")
	$idOptionsItem1 = GUICtrlCreateMenu("Andocken", $idOptionsMenu)

	$idOptionsItem2 = GUICtrlCreateMenuItem("Angedockt", $idOptionsItem1)
	GUICtrlCreateMenuItem("", $idOptionsItem1)
	$idOptionsItem3 = GUICtrlCreateMenuItem("Nebeneinander", $idOptionsItem1)
	$idOptionsItem4 = GUICtrlCreateMenuItem("Untereinander", $idOptionsItem1)
	GUICtrlSetState($idOptionsItem2, $GUI_CHECKED)
	GUICtrlSetState($idOptionsItem3, $GUI_CHECKED)
	GUICtrlSetOnEvent($idOptionsItem2, "_SetDocking")
	GUICtrlSetOnEvent($idOptionsItem3, "_SetDockSideBySide")
	GUICtrlSetOnEvent($idOptionsItem4, "_SetDockTopAndBottom")

	GUISetOnEvent($GUI_EVENT_CLOSE, "SpecialEvents")
	GUISetOnEvent($GUI_EVENT_MINIMIZE, "SpecialEvents")
	GUISetOnEvent($GUI_EVENT_RESTORE, "SpecialEvents")

	; Benötigt das Handle, weil die Items mit UDF-Funktionen erstellt werden
	$g_hListView = GUICtrlGetHandle(GUICtrlCreateListView("", 2, 2, $iWidth - 100, 268, BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS), $WS_EX_CLIENTEDGE))
	_GUICtrlListView_SetExtendedListViewStyle($g_hListView, $iStylesEx)

	$id_MoveRight = GUICtrlCreateButton("Verschieben", $iWidth - 95, 35, 90, 20)
	GUICtrlSetOnEvent($id_MoveRight, "_MoveRight")

	$id_CopyRight = GUICtrlCreateButton("Kopieren", $iWidth - 95, 60, 90, 20)
	GUICtrlSetOnEvent($id_CopyRight, "_CopyRight")

	$id_Exit1 = GUICtrlCreateButton("Beenden", $iWidth - 95, 140, 90, 25)
	GUICtrlSetOnEvent($id_Exit1, "_Exit")

	$g_hGUI2 = GUICreate("Rechtes/unteres Fenster", $iWidth, 300, $iWidth + 15, 10)

	$idOptions2Menu = GUICtrlCreateMenu("Optionen")
	$idOptions2Item1 = GUICtrlCreateMenu("Andocken", $idOptions2Menu)
	$g_idOptions2Item2 = GUICtrlCreateMenuItem("Angedockt", $idOptions2Item1)
	GUICtrlCreateMenuItem("", $idOptions2Item1)
	$g_idOptions2Item3 = GUICtrlCreateMenuItem("Nebeneinander", $idOptions2Item1)
	$g_idOptions2Item4 = GUICtrlCreateMenuItem("Untereinander", $idOptions2Item1)
	GUICtrlSetState($g_idOptions2Item2, $GUI_CHECKED)
	GUICtrlSetState($g_idOptions2Item3, $GUI_CHECKED)
	GUICtrlSetOnEvent($g_idOptions2Item2, "_SetDocking2")
	GUICtrlSetOnEvent($g_idOptions2Item3, "_SetDockSideBySide2")
	GUICtrlSetOnEvent($g_idOptions2Item4, "_SetDockTopAndBottom2")

	GUISetOnEvent($GUI_EVENT_CLOSE, "SpecialEvents")
	GUISetOnEvent($GUI_EVENT_MINIMIZE, "SpecialEvents")
	GUISetOnEvent($GUI_EVENT_RESTORE, "SpecialEvents")

	$g_hListView2 = GUICtrlGetHandle(GUICtrlCreateListView("", 2, 2, $iWidth - 100, 268, BitOR($LVS_REPORT, $LVS_SHOWSELALWAYS), $WS_EX_CLIENTEDGE))
	_GUICtrlListView_SetExtendedListViewStyle($g_hListView2, $iStylesEx)

	$id_MoveLeft = GUICtrlCreateButton("Verschieben", $iWidth - 95, 35, 90, 20)
	GUICtrlSetOnEvent($id_MoveLeft, "_MoveLeft")

	$id_CopyLeft = GUICtrlCreateButton("Kopieren", $iWidth - 95, 60, 90, 20)
	GUICtrlSetOnEvent($id_CopyLeft, "_CopyLeft")

	$id_Exit2 = GUICtrlCreateButton("Beenden", $iWidth - 95, 140, 90, 25)
	GUICtrlSetOnEvent($id_Exit2, "_Exit")

	GUISetState(@SW_SHOW, $g_hGUI2)
	GUISetState(@SW_SHOW, $g_hGUI1)

	; Setzt das ANSI Format
	_GUICtrlListView_SetUnicodeFormat($g_hListView, False)

	; Lädt die Bilder
	$hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 13)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 14)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 15)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 16)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 17)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 18)
	_GUICtrlListView_SetImageList($g_hListView, $hImage, 1)
	_GUICtrlListView_SetImageList($g_hListView2, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($g_hListView, "Spalte 1", 122)
	_GUICtrlListView_AddColumn($g_hListView, "Spalte 2", 112)
	_GUICtrlListView_AddColumn($g_hListView, "Spalte 3", 112)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($g_hListView2, "Spalte 1", 122)
	_GUICtrlListView_AddColumn($g_hListView2, "Spalte 2", 112)
	_GUICtrlListView_AddColumn($g_hListView2, "Spalte 3", 112)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($g_hListView, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($g_hListView, 0, "Zeile 1: Spalte 2", 1, 1)
	_GUICtrlListView_AddSubItem($g_hListView, 0, "Zeile 1: Spalte 3", 2, 2)
	_GUICtrlListView_AddItem($g_hListView, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($g_hListView, 1, "Zeile 2: Spalte 2", 1, 2)
	_GUICtrlListView_AddItem($g_hListView, "Zeile 3: Spalte 1", 2)
	_GUICtrlListView_AddItem($g_hListView, "Zeile 4: Spalte 1", 3)
	_GUICtrlListView_AddItem($g_hListView, "Zeile 5: Spalte 1", 4)
	_GUICtrlListView_AddSubItem($g_hListView, 4, "Zeile 5: Spalte 2", 1, 3)
	_GUICtrlListView_AddItem($g_hListView, "Zeile 6: Spalte 1", 5)
	_GUICtrlListView_AddSubItem($g_hListView, 5, "Zeile 6: Spalte 2", 1, 4)
	_GUICtrlListView_AddSubItem($g_hListView, 5, "Zeile 6: Spalte 3", 2, 3)

	While $g_iRun
		If $g_iDock Then _KeepWindowsDocked()
		Sleep(10)
	WEnd
EndFunc   ;==>Example

Func _SetDocking()
	If BitAND(GUICtrlRead($idOptionsItem2), $GUI_CHECKED) = $GUI_CHECKED Then
		GUICtrlSetState($idOptionsItem2, $GUI_UNCHECKED)
		GUICtrlSetState($g_idOptions2Item2, $GUI_UNCHECKED)
		$g_iDock = 0
	Else
		GUICtrlSetState($idOptionsItem2, $GUI_CHECKED)
		GUICtrlSetState($g_idOptions2Item2, $GUI_CHECKED)
		$g_iDock = 2
	EndIf
	If $g_iDock Then _KeepWindowsDocked()
EndFunc   ;==>_SetDocking

Func _SetDocking2()
	If BitAND(GUICtrlRead($g_idOptions2Item2), $GUI_CHECKED) = $GUI_CHECKED Then
		GUICtrlSetState($idOptionsItem2, $GUI_UNCHECKED)
		GUICtrlSetState($g_idOptions2Item2, $GUI_UNCHECKED)
		$g_iDock = 0
	Else
		GUICtrlSetState($idOptionsItem2, $GUI_CHECKED)
		GUICtrlSetState($g_idOptions2Item2, $GUI_CHECKED)
		$g_iDock = 2
	EndIf
	If $g_iDock Then _KeepWindowsDocked()
EndFunc   ;==>_SetDocking2

Func _SetDockSideBySide()
	If BitAND(GUICtrlRead($idOptionsItem3), $GUI_CHECKED) = $GUI_CHECKED Then
		GUICtrlSetState($idOptionsItem3, $GUI_UNCHECKED)
		GUICtrlSetState($idOptionsItem4, $GUI_CHECKED)
		GUICtrlSetState($g_idOptions2Item3, $GUI_UNCHECKED)
		GUICtrlSetState($g_idOptions2Item4, $GUI_CHECKED)
		$g_iDock_Location = 2
	Else
		GUICtrlSetState($idOptionsItem3, $GUI_CHECKED)
		GUICtrlSetState($idOptionsItem4, $GUI_UNCHECKED)
		GUICtrlSetState($g_idOptions2Item3, $GUI_CHECKED)
		GUICtrlSetState($g_idOptions2Item4, $GUI_UNCHECKED)
		$g_iDock_Location = 1
		If $g_iDock Then $g_iDock = 2
	EndIf
	If $g_iDock Then _KeepWindowsDocked()
EndFunc   ;==>_SetDockSideBySide

Func _SetDockSideBySide2()
	If BitAND(GUICtrlRead($g_idOptions2Item3), $GUI_CHECKED) = $GUI_CHECKED Then
		GUICtrlSetState($idOptionsItem3, $GUI_UNCHECKED)
		GUICtrlSetState($idOptionsItem4, $GUI_CHECKED)
		GUICtrlSetState($g_idOptions2Item3, $GUI_UNCHECKED)
		GUICtrlSetState($g_idOptions2Item4, $GUI_CHECKED)
		$g_iDock_Location = 2
	Else
		GUICtrlSetState($idOptionsItem3, $GUI_CHECKED)
		GUICtrlSetState($idOptionsItem4, $GUI_UNCHECKED)
		GUICtrlSetState($g_idOptions2Item3, $GUI_CHECKED)
		GUICtrlSetState($g_idOptions2Item4, $GUI_UNCHECKED)
		$g_iDock_Location = 1
		If $g_iDock Then $g_iDock = 2
	EndIf
	If $g_iDock Then _KeepWindowsDocked()
EndFunc   ;==>_SetDockSideBySide2

Func _SetDockTopAndBottom()
	If BitAND(GUICtrlRead($idOptionsItem4), $GUI_CHECKED) = $GUI_CHECKED Then
		GUICtrlSetState($idOptionsItem4, $GUI_UNCHECKED)
		GUICtrlSetState($idOptionsItem3, $GUI_CHECKED)
		GUICtrlSetState($g_idOptions2Item4, $GUI_UNCHECKED)
		GUICtrlSetState($g_idOptions2Item3, $GUI_CHECKED)
		$g_iDock_Location = 1
	Else
		GUICtrlSetState($idOptionsItem4, $GUI_CHECKED)
		GUICtrlSetState($idOptionsItem3, $GUI_UNCHECKED)
		GUICtrlSetState($g_idOptions2Item4, $GUI_CHECKED)
		GUICtrlSetState($g_idOptions2Item3, $GUI_UNCHECKED)
		$g_iDock_Location = 2
		If $g_iDock Then $g_iDock = 2
	EndIf
	If $g_iDock Then _KeepWindowsDocked()
EndFunc   ;==>_SetDockTopAndBottom

Func _SetDockTopAndBottom2()
	If BitAND(GUICtrlRead($g_idOptions2Item4), $GUI_CHECKED) = $GUI_CHECKED Then
		GUICtrlSetState($idOptionsItem4, $GUI_UNCHECKED)
		GUICtrlSetState($idOptionsItem3, $GUI_CHECKED)
		GUICtrlSetState($g_idOptions2Item4, $GUI_UNCHECKED)
		GUICtrlSetState($g_idOptions2Item3, $GUI_CHECKED)
		$g_iDock_Location = 1
	Else
		GUICtrlSetState($idOptionsItem4, $GUI_CHECKED)
		GUICtrlSetState($idOptionsItem3, $GUI_UNCHECKED)
		GUICtrlSetState($g_idOptions2Item4, $GUI_CHECKED)
		GUICtrlSetState($g_idOptions2Item3, $GUI_UNCHECKED)
		$g_iDock_Location = 2
		If $g_iDock Then $g_iDock = 2
	EndIf
	If $g_iDock Then _KeepWindowsDocked()
EndFunc   ;==>_SetDockTopAndBottom2

Func _KeepWindowsDocked()
	Local $p_win1 = WinGetPos($g_hGUI1)
	Local $p_win2 = WinGetPos($g_hGUI2)
	If $g_iDock_Location == 1 Then
		If (($p_win1[0] <> $g_iX1 Or $p_win1[1] <> $g_iY1) And BitAND(WinGetState($g_hGUI1), 8) Or $g_iDock = 2) Then
			$g_iX1 = $p_win1[0]
			$g_iY1 = $p_win1[1]
			$g_iX2 = $p_win1[2] + $g_iX1
			$g_iY2 = $g_iY1
			WinMove($g_hGUI2, "", $g_iX2, $g_iY2)
			$g_iDock = 1
		ElseIf (($p_win2[0] <> $g_iX2 Or $p_win2[1] <> $g_iY2) And BitAND(WinGetState($g_hGUI2), 8)) Then
			$g_iX2 = $p_win2[0]
			$g_iY2 = $p_win2[1]
			$g_iX1 = $p_win2[0] - $p_win1[2]
			$g_iY1 = $g_iY2
			WinMove($g_hGUI1, "", $g_iX1, $g_iY1)
		EndIf
	Else
		If (($p_win1[0] <> $g_iX1 Or $p_win1[1] <> $g_iY1) And BitAND(WinGetState($g_hGUI1), 8) Or $g_iDock = 2) Then
			$g_iX1 = $p_win1[0]
			$g_iY1 = $p_win1[1]
			$g_iX2 = $g_iX1
			$g_iY2 = $p_win1[3] + $g_iY1
			WinMove($g_hGUI2, "", $g_iX2, $g_iY2)
			$g_iDock = 1
		ElseIf (($p_win2[0] <> $g_iX2 Or $p_win2[1] <> $g_iY2) And BitAND(WinGetState($g_hGUI2), 8)) Then
			$g_iX2 = $p_win2[0]
			$g_iY2 = $p_win2[1]
			$g_iX1 = $g_iX2
			$g_iY1 = $p_win2[1] - $p_win1[3]
			WinMove($g_hGUI1, "", $g_iX1, $g_iY1)
		EndIf
	EndIf
EndFunc   ;==>_KeepWindowsDocked

Func _CopyRight()
	_GUICtrlListView_CopyItems($g_hListView, $g_hListView2)
EndFunc   ;==>_CopyRight

Func _MoveRight()
	_GUICtrlListView_CopyItems($g_hListView, $g_hListView2, 1)
EndFunc   ;==>_MoveRight

Func _CopyLeft()
	_GUICtrlListView_CopyItems($g_hListView2, $g_hListView)
EndFunc   ;==>_CopyLeft

Func _MoveLeft()
	_GUICtrlListView_CopyItems($g_hListView2, $g_hListView, 1)
EndFunc   ;==>_MoveLeft

Func _Exit()
	$g_iRun = 0
	GUIDelete($g_hGUI2)
	GUIDelete($g_hGUI1)
EndFunc   ;==>_Exit

Func SpecialEvents()
	Select
		Case @GUI_CtrlId = $GUI_EVENT_CLOSE
			_Exit()
	EndSelect
EndFunc   ;==>SpecialEvents
