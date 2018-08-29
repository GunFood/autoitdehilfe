#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>

Example()

Func Example()
	Local $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Spaltenbreite setzen", 400, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($LBS_STANDARD, $LBS_MULTICOLUMN))
	GUISetState(@SW_SHOW)

	; Setzt die Breite der Spalten
	_GUICtrlListBox_SetColumnWidth($idListBox, 100)

	; Fügt Strings hinzu
	_GUICtrlListBox_BeginUpdate($idListBox)
	For $iI = 1 To 50
		_GUICtrlListBox_AddString($idListBox, StringFormat("Item %03d", $iI))
	Next
	_GUICtrlListBox_EndUpdate($idListBox)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
