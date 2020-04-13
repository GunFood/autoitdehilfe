#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiTab.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $aItem, $idTab, $hImage, $idTab0

	; Erstellt eine GUI
	GUICreate("Tab-Control: Item ermitteln", 400, 300)
	$idTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Erstellt die Bilder
	$hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 146)
	_GUICtrlTab_SetImageList($idTab, $hImage)

	; Fügt Tabs hinzu
	$idTab0 = GUICtrlCreateTabItem("Tab 0")
	$g_idMemo = GUICtrlCreateEdit("", 4, 28, 390, 265)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUICtrlCreateTabItem("")
	GUICtrlCreateTabItem("Tab 1")
	GUICtrlCreateTabItem("")
	GUICtrlCreateTabItem("Tab 2")
	GUICtrlCreateTabItem("")
	GUICtrlSetState($idTab0, $GUI_SHOW)

	; Ermittelt/Setzt Tab 0
	_GUICtrlTab_SetItem($idTab, 0, "Neuer Text", BitOR($TCIS_BUTTONPRESSED, $TCIS_BUTTONPRESSED), 2)
	_GUICtrlTab_SetItem($idTab, 1, -1, -1, 4)
	_GUICtrlTab_SetItem($idTab, 2, -1, -1, 5)
	GUISetState(@SW_LOCK)
	For $x = 0 To 2
		$aItem = _GUICtrlTab_GetItem($idTab, $x)
		MemoWrite("Tab-Item " & $x & @CRLF & "---------------------")
		For $y = 0 To 3
			MemoWrite("$aItem[" & $y & "]: " & $aItem[$y])
		Next
		MemoWrite(@CRLF & "---------------------")
	Next
	GUISetState(@SW_UNLOCK)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
