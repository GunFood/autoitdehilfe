#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGui = GUICreate("Header", 400, 300)

	Local $hHeader = _GUICtrlHeader_Create($hGUI)
	_MemoCreate(2, 52, 444, 220)

	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)

	; Zeigt das Unicode Format
	_MemoWrite("Verwendung von Unicode Zeichen: " & _GUICtrlHeader_GetUnicodeFormat($hHeader))

	; Setzt das Ansi Format
	_GUICtrlHeader_SetUnicodeFormat($hHeader, False)

	; Zeigt das Ansi Format
	_MemoWrite("Verwendung von Unicode Zeichen: " & _GUICtrlHeader_GetUnicodeFormat($hHeader))

	_MemoMsgBoxStatus("", -1, $hGui) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example