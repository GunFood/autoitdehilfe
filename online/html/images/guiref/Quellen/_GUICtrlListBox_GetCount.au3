#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>

Opt('MustDeclareVars', 1)

_Main()

Func _Main()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt die Anzahl an Items", 400, 296)
	$hListBox = GUICtrlCreateList("", 20, 20, 150, 150)

	GUISetState()

	; F&uuml;gt Strings hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; Ermittelt die Anzahl an Items
	MsgBox(4160, "Information", "Anzahl an Items: " & _GUICtrlListBox_GetCount($hListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main
