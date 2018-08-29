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

	GUICreate("ImageList: Quellbild zum Index des Zielbildes kopieren", 410, 300)
	$idListview = GUICtrlCreateListView("", 2, 2, 404, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	GUISetState(@SW_SHOW)

	; Erstellt eine Imagelist mit Bildern
	$hImage = _GUIImageList_Create(11, 11)
	ConsoleWrite(_GUIImageList_AddIcon($hImage, $AutoItDir & "\Icons\au3.ico") & @CRLF)
	ConsoleWrite(_GUIImageList_AddIcon($hImage, $AutoItDir & "\Icons\au3script_v9.ico") & @CRLF)
	ConsoleWrite(_GUIImageList_AddIcon($hImage, $AutoItDir & "\Icons\au3script_v10.ico") & @CRLF)
	ConsoleWrite(_GUIImageList_AddIcon($hImage, $AutoItDir & "\Icons\filetype-blank.ico") & @CRLF)
	_GUIImageList_Copy($hImage, 0, 3)
	_GUICtrlListView_SetImageList($idListview, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Spalte 1", 100, 1, 0, True)
	_GUICtrlListView_AddColumn($idListview, "Spalte 2", 100, 0, 1, True)
	_GUICtrlListView_AddColumn($idListview, "Spalte 3", 100, 2, 2, True)
	_GUICtrlListView_AddColumn($idListview, "Spalte 4", 100, 0, 3)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
