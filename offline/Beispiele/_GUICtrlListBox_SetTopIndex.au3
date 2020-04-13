#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sText, $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt den Index des ersten sichtbaren Items", 500, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 496, 296)
	GUISetState(@SW_SHOW)

	; Fügt Strings hinzu
	_GUICtrlListBox_BeginUpdate($idListBox)
	For $iI = 1 To 100
		$sText = StringFormat("%03d : Zufallstring ", $iI)
		For $iX = 1 To Random(1, 20, 1)
			$sText &= Chr(Random(65, 90, 1))
		Next
		_GUICtrlListBox_AddString($idListBox, $sText)
	Next
	_GUICtrlListBox_EndUpdate($idListBox)

	; Ermittelt den Index des ersten sichtbaren Items
	MsgBox(8256, "Information", "Index des ersten sichtbaren Items: " & _GUICtrlListBox_GetTopIndex($idListBox))

	; Stellt sicher, dass ein bestimmtes Item sichtbar ist
	_GUICtrlListBox_SetTopIndex($idListBox, 50)

	; Ermittelt den Index des ersten sichtbaren Items
	MsgBox(8256, "Information", "Index des ersten sichtbaren Items: " & _GUICtrlListBox_GetTopIndex($idListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
