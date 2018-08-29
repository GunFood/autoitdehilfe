#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>

Example()

Func Example()
	Local $iIndex, $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittele den Cursor-Index", 400, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 396, 296)

	GUISetState(@SW_SHOW)

	; Fügt Strings hinzu
	_GUICtrlListBox_BeginUpdate($idListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($idListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($idListBox)

	; Setzt den Cursor-Index
	_GUICtrlListBox_SetCaretIndex($idListBox, 2)

	; Liest den Cursor-Index
	$iIndex = _GUICtrlListBox_GetCaretIndex($idListBox)
	_GUICtrlListBox_SetCurSel($idListBox, $iIndex)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
