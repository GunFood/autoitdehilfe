#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIGdi.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Tab-Control: Setzt und ermittelt die Imagelist (v" & @AutoItVersion & ")", 500, 300)
	Local $hTab = _GUICtrlTab_Create($hGUI, 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Erstellt die Bilder
	Local $hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x0000FF, 16, 16))
	$hImage = _GUICtrlTab_SetImageList($hTab, $hImage)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 0", 0)
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 1", 1)
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 2", 2)

	; Zeigt das Handle der Imagelist
	MsgBox($MB_SYSTEMMODAL, "Information", "Handle der Imagelist: 0x" & Hex($hImage) & @CRLF & _
			"IsPtr = " & IsPtr($hImage) & " IsHWnd = " & IsHWnd($hImage))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
