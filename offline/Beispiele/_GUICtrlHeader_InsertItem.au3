#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Header: Item einfügen (v" & @AutoItVersion & ")", 400, 300)
	Local $hHeader = _GUICtrlHeader_Create($hGUI)
	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)

	; Neue Spalte einfügen
	_GUICtrlHeader_InsertItem($hHeader, 1, "Spalte X", 100, 2)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
