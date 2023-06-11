#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>

Example()

Func Example()
	Local $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: String löschen", 400, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 396, 296)

	GUISetState(@SW_SHOW)

	; Fügt Strings hinzu
	_GUICtrlListBox_BeginUpdate($idListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($idListBox, StringFormat("%d : ListBox String", $iI))
	Next
	_GUICtrlListBox_EndUpdate($idListBox)

	; Löscht den mittleren String
	_GUICtrlListBox_DeleteString($idListBox, 4)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
