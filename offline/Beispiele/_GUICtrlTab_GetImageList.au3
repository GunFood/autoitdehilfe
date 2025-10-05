#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIGdi.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Tab-Control: Setzt und ermittelt die Imagelist (v" & @AutoItVersion & ")", 500, 300, 100, 100)
	Local $idTab = _GUICtrlTab_Create($hGUI, 2, 2, 396, 296)
	_MemoMsgBoxStatus() ; Statuserstellung

	GUISetState(@SW_SHOW)

	; Erstellt die Bilder
	Local $hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x0000FF, 16, 16))
	$hImage = _GUICtrlTab_SetImageList($idTab, $hImage)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 0", 0)
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 1", 1)
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 2", 2)

	; Zeigt das Handle der Imagelist
	_MemoMsgBox($MB_SYSTEMMODAL, "Information", "Handle der Imagelist: 0x" & Hex($hImage) & @CRLF & _
			"IsPtr = " & IsPtr($hImage) & " IsHWnd = " & IsHWnd($hImage))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example
