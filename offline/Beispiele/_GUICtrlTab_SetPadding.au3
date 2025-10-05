#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIGdi.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Tab-Control: Setzt den freien Platz der sich um jedes Tabicon und Label befinden soll - v(" & @AutoItVersion & ")", 450, 300, 100, 100)
	Local $idTab = GUICtrlCreateTab(2, 2, 446, 266)
	_MemoMsgBoxStatus() ; Statuserstellung

	GUISetState(@SW_SHOW)

	; Erstellt die Bilder
	Local $hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0x0000FF, 16, 16))
	_GUICtrlTab_SetImageList($idTab, $hImage)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 0", 0)
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 1", 1)
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 2", 2)
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Setzt den freien Platz")

	_GUICtrlTab_DeleteAllItems($idTab)
	_GUICtrlTab_SetPadding($idTab, 20, 4)
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 0", 0)
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 1", 1)
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 2", 2)

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example
