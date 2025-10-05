#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiTab.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Tab-Control: Setzt und ermittelt das Item (v" & @AutoItVersion & ")", 500, 300, 100, 100)
	Local $idTab = GUICtrlCreateTab(2, 2, 446, 266)
	_MemoCreate(4, 28, 442, 236)

	GUISetState(@SW_SHOW)

	; Erstellt die Bilder
	Local $hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 146)
	_GUICtrlTab_SetImageList($idTab, $hImage)

	; Fügt Tabs hinzu
	Local $idTBi_Tab0 = GUICtrlCreateTabItem("Tab 0")
	GUICtrlCreateTabItem("")
	GUICtrlCreateTabItem("Tab 1")
	GUICtrlCreateTabItem("")
	GUICtrlCreateTabItem("Tab 2")
	GUICtrlCreateTabItem("")
	GUICtrlSetState($idTBi_Tab0, $GUI_SHOW)

	; Ermittelt/Setzt Tab 0
	_GUICtrlTab_SetItem($idTab, 0, "Neuer Text", BitOR($TCIS_BUTTONPRESSED, $TCIS_BUTTONPRESSED), 2)
	_GUICtrlTab_SetItem($idTab, 1, -1, -1, 4)
	_GUICtrlTab_SetItem($idTab, 2, -1, -1, 5)

	GUISetState(@SW_LOCK)
	Local $aItem
	For $x = 0 To 2
		_MemoWrite(@CRLF & "=====================")
		_MemoWrite("Tab Item " & $x)
		_MemoWrite("=====================")
		$aItem = _GUICtrlTab_GetItem($idTab, $x)
		For $y = 0 To 3
			_MemoWrite("$aItem[" & $y & "]: " & $aItem[$y])
		Next
	Next
	GUISetState(@SW_UNLOCK)

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example
