#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate('ListBox: Setzt und ermittelt den "markier-Status" eines Items (v' & @AutoItVersion & ")", 600, 296)
	Local $idListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($LBS_STANDARD, $LBS_EXTENDEDSEL))
	GUISetState(@SW_SHOW)

	; Fügt Strings hinzu
	_GUICtrlListBox_BeginUpdate($idListBox)
	For $iI = 0 To 9
		_GUICtrlListBox_AddString($idListBox, StringFormat("%03d : String", $iI))
	Next
	_GUICtrlListBox_EndUpdate($idListBox)

	; Wählt ein paar Items aus
	_GUICtrlListBox_SetSel($idListBox, 3)
	_GUICtrlListBox_SetSel($idListBox, 4)
	_GUICtrlListBox_SetSel($idListBox, 5)

	; Ermittelt den "markier-Status" eines Items
	MsgBox(8156, "Information", "Item 4 ausgewählt: " & _GUICtrlListBox_GetSel($idListBox, 4))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
