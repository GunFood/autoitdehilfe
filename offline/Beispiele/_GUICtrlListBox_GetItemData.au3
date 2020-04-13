#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>

; Warnung! Diese Funktion sollte nicht bei Items, die mit einer in AutoIT eingebauten Funktion erstellt wurden, angewendet werden!
; Die Item Daten sind die Control-ID für jeden String.

Example()

Func Example()
	Local $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt Item Daten", 400, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Strings hinzu
	_GUICtrlListBox_BeginUpdate($idListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($idListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($idListBox)

	; Setzt die Item Daten
	_GUICtrlListBox_SetItemData($idListBox, 4, 1234)

	; Ermittelt die Item Daten
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 5 Daten: " & _GUICtrlListBox_GetItemData($idListBox, 4))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
