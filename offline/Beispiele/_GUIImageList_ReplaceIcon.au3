#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <WinAPIIcons.au3>

Example()

Func Example()
	Local $idListview, $hImage
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sAutoItDir = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir")

	GUICreate("Imagelist: AddIcon", 490, 300)
	$idListview = GUICtrlCreateListView("", 2, 2, 484, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	GUISetState(@SW_SHOW)

	; Erstellt eine neue Imagelist mit den Bildern
	$hImage = _GUIImageList_Create(11, 11)
	AddIcon($hImage, $sAutoItDir & "Icons\au3.ico")
	AddIcon($hImage, $sAutoItDir & "Icons\au3script_v9.ico")
	AddIcon($hImage, $sAutoItDir & "Icons\au3script_v10.ico")
	AddIcon($hImage, $sAutoItDir & "\Icons\au3script_v11.ico")
	_GUICtrlListView_SetImageList($idListview, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListview, "Spalte 1", 100, 0, 0)
	_GUICtrlListView_AddColumn($idListview, "Spalte 2", 100, 1, 1)
	_GUICtrlListView_AddColumn($idListview, "Spalte 3", 100, 2, 2)
	_GUICtrlListView_AddColumn($idListview, "Spalte 4", 100, 1, 3)
	_GUICtrlListView_AddColumn($idListview, "Spalte 5", 120)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Dies ist der lange Weg um ein Icon hinzuzufügen. Stattdessen ist _GUIImageList_AddIcon zu verwenden
Func AddIcon($hWnd, $sFile, $iIndex = 0)
	Local $pIcon, $tIcon, $hIcon

	$tIcon = DllStructCreate("int Icon")
	$pIcon = DllStructGetPtr($tIcon)
	_WinAPI_ExtractIconEx($sFile, $iIndex, 0, $pIcon, 1)
	$hIcon = DllStructGetData($tIcon, "Icon")
	_GUIImageList_ReplaceIcon($hWnd, -1, $hIcon)
	_WinAPI_DestroyIcon($hIcon)
EndFunc   ;==>AddIcon
