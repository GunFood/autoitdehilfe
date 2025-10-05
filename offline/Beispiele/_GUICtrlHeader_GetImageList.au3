#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>
#include <GuiImageList.au3>
#include <WinAPIGdi.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Header: Setzt und ermittelt die  ImageList (v" & @AutoItVersion & ")", 500, 300, 100, 100)
	Local $hHeader = _GUICtrlHeader_Create($hGUI)
	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)
	_MemoCreate(2, 52, 444, 220)
	GUISetState(@SW_SHOW)

	; Erstellt eine Imagelist mit Bildern
	Local $hImage = _GUIImageList_Create(11, 11)
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0xFF0000, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x00FF00, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x0000FF, 11, 11))
	Local $hPrevImageList = _GUICtrlHeader_SetImageList($hHeader, $hImage)

	_MemoWrite("Vorheriges Handle der Imagelist ....: " & "0x" & Hex($hPrevImageList))
	_MemoWrite("IsPtr = " & IsPtr($hPrevImageList) & " IsHWnd = " & IsHWnd($hPrevImageList))

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 100, 0, 0)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100, 0, 1)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100, 0, 2)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)

	; Zeigt Informationen über das Header-Control
	_MemoWrite("Handle der Imagelist ....: " & "0x" & Hex(_GUICtrlHeader_GetImageList($hHeader)))
	_MemoWrite("IsPtr = " & IsPtr(_GUICtrlHeader_GetImageList($hHeader)) & " IsHwnd = " & IsHWnd(_GUICtrlHeader_GetImageList($hHeader)))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example