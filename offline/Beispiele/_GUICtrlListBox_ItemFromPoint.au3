#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt den Index des Items am angegebenen Punkt", 520, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 516, 296)
	GUISetState(@SW_SHOW)

	; Fügt Strings hinzu
	_GUICtrlListBox_BeginUpdate($idListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($idListBox, StringFormat("%d : Zufallstring " & $iI, Random(1, 99, 1)))
	Next
	_GUICtrlListBox_EndUpdate($idListBox)

	; Ermittelt den 0-basierenden Index des Items, das den angegebenen Koordinaten am nächsten liegt
	MsgBox(8256, "Information", "Index des Items, das den Koordinaten 30,30 am nächsten ist: " & _GUICtrlListBox_ItemFromPoint($idListBox, 30, 30))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
