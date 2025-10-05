#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGui = GUICreate("Header", 400, 300, 100, 100)
	Local $hHeader = _GUICtrlHeader_Create($hGui)
	_MemoCreate(2, 52, 444, 220)

;~ 	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)

	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)

	; Setzt die Ausrichtung von Spalte 0 zurück
	_GUICtrlHeader_SetItemAlign($hHeader, 0, 2)

	; Zeigt die Ausrichtung von Spalte 0
	_MemoWrite("Ausrichtung von Spalte 0: " & _GUICtrlHeader_GetItemAlign($hHeader, 0))

	_MemoMsgBoxStatus("", -1, $hGui) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example