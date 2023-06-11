#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $idListview, $hImage
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $AutoItDir = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir")
	Local $hImage2

	GUICreate("Imagelist: Verdoppeln", 410, 300)
	$idListview = GUICtrlCreateListView("", 2, 2, 404, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	GUISetState(@SW_SHOW)

	; Erstellt eine neue Imagelist mit den Bildern
	$hImage = _GUIImageList_Create(11, 11)
	_GUIImageList_AddIcon($hImage, $AutoItDir & "\Icons\au3.ico")
	_GUIImageList_AddIcon($hImage, $AutoItDir & "\Icons\au3script_v9.ico")
	_GUIImageList_AddIcon($hImage, $AutoItDir & "\Icons\au3script_v10.ico")
	$hImage2 = _GUIImageList_Duplicate($hImage)
	_GUICtrlListView_SetImageList($idListview, $hImage2, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Spalte 1", 100, "Left", 0)
	_GUICtrlListView_AddColumn($idListview, "Spalte 2", 100, "Left", 1)
	_GUICtrlListView_AddColumn($idListview, "Spalte 3", 100, "Left", 2)
	_GUICtrlListView_AddColumn($idListview, "Spalte 4", 120)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
