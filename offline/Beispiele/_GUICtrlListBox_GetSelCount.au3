#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt die Anzahl von markierten Items", 450, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($LBS_STANDARD, $LBS_EXTENDEDSEL))
	GUISetState(@SW_SHOW)

	; Fügt Strings hinzu
	_GUICtrlListBox_BeginUpdate($idListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($idListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($idListBox)

	; Wählt ein paar Items aus
	_GUICtrlListBox_SetSel($idListBox, 3)
	_GUICtrlListBox_SetSel($idListBox, 4)
	_GUICtrlListBox_SetSel($idListBox, 5)

	; Ermittelt die Anzahl von markierten Items
	MsgBox($MB_SYSTEMMODAL, "Information", "markierte Items: " & _GUICtrlListBox_GetSelCount($idListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
