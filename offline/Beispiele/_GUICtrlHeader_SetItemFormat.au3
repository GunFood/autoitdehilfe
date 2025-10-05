#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>
#include <GuiImageList.au3>
#include <WinAPIGdi.au3>

Example()

Func Example()
	Local $hGui, $hHeader, $hImage

	; Erstellt eine GUI
	Local $hGUI = GUICreate("Header Ermittelt bzw. setzt ItemFormat (v" & @AutoItVersion & ")", 450, 300, 100, 100)
	$hHeader = _GUICtrlHeader_Create($hGui)
	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)
	$_g_idLst_Memo = GUICtrlCreateEdit("", 2, 24, 396, 274, 0)
	GUICtrlSetFont($_g_idLst_Memo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Erstellt eine Imagelist mit Bildern
	Local $hImage = _GUIImageList_Create(11, 11)
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0xFF0000, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0x00FF00, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0x0000FF, 11, 11))
	_GUICtrlHeader_SetImageList($hHeader, $hImage)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 100, 0, 0)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100, 0, 1)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100, 0, 2)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)

	; Setzt das Format von Spalte 0
	_GUICtrlHeader_SetItemFormat($hHeader, 0, BitOR($HDF_CENTER, $HDF_STRING))

	; Zeigt das Format von Spalte 0
	_MemoWrite("Format von Spalte 0: " & "0x" & Hex(_GUICtrlHeader_GetItemFormat($hHeader, 0)))

	Sleep(1000)

	; Setzt das Format von Spalte 0 zurück
	_GUICtrlHeader_SetItemFormat($hHeader, 0, BitOR($HDF_LEFT, $HDF_STRING, $HDF_IMAGE))

	; Zeigt das Format von Spalte 0
	_MemoWrite("Format von Spalte 0: " & "0x" & Hex(_GUICtrlHeader_GetItemFormat($hHeader, 0)))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example