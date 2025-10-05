#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>

Example()

Func Example()
	Local $hGui, $hHeader

	; Erstellt eine GUI
	Local $hGUI = GUICreate("Header Bitmaprandbreite ermitteln (v" & @AutoItVersion & ")", 450, 300, 100, 100)
	Local $hHeader = _GUICtrlHeader_Create($hGUI)
	_MemoCreate(2, 52, 444, 220)

;~ 	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)

	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)

	; Ermittelt die Breite des Bitmaprandes
	_MemoWrite("Aktueller Rand .: " & _GUICtrlHeader_GetBitmapMargin($hHeader))

	; Setzt die Breite des Randes eines Bitmaps
	_GUICtrlHeader_SetBitmapMargin($hHeader, 8)

	; Ermittelt die Breite des Bitmaprandes
	_MemoWrite("Neuer Rand .....: " & _GUICtrlHeader_GetBitmapMargin($hHeader))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example