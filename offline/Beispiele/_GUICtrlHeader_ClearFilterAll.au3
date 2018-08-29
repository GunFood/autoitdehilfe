#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>

Example()

Func Example()
	Local $hGui, $hHeader

	; Erstellt eine GUI
	$hGui = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGui)
	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 4", 100)

	; Setzt die Filter
	_GUICtrlHeader_EditFilter($hHeader, 0)
	Send("Filter 1")
	Sleep(1000)
	Send("{ENTER}")
	_GUICtrlHeader_EditFilter($hHeader, 1)
	Send("Filter 2")
	Sleep(1000)
	Send("{ENTER}")

	; Löscht alle Filter
	_GUICtrlHeader_ClearFilterAll($hHeader)

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
