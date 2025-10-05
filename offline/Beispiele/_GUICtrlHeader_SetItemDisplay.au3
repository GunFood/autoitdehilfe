#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>
#include <GuiImageList.au3>
#include <WinAPIGdi.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGui = GUICreate("Header", 400, 300)
	Local $hHeader = _GUICtrlHeader_Create($hGui)
	_MemoCreate(2, 52, 444, 220)

;~ 	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)

	GUISetState(@SW_SHOW)

	; Erstellt eine Imagelist mit Bildern
	Local $hImage = _GUIImageList_Create(11, 11)
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0xFF0000, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0x00FF00, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0x0000FF, 11, 11))
	_GUICtrlHeader_SetImageList($hHeader, $hImage)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 100, 0)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100, 0, 1)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100, 0, 2)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)

	; Setzt das Bitmap von Spalte 0
	_GUICtrlHeader_SetItemBitmap($hHeader, 0, _WinAPI_CreateSolidBitmap($hGui, 0xFF00FF, 11, 11))

	; Setzt die Itemanzeige von Spalte 0
	_GUICtrlHeader_SetItemDisplay($hHeader, 0, 1 + 2 + 8 + 16) ; String (8), Bitmap (1) und Bild (16) werden rechts angezeigt (2)

	; Gibt die Anzeigeinformationen für das Item zurück
	_MemoWrite("Anzeigeinformationen für Spalte 0: " & _GUICtrlHeader_GetItemDisplay($hHeader, 0))

	_MemoMsgBoxStatus("", -1, $hGui) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example