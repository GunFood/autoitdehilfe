#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt die Itemhöhe", 400, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Strings hinzu
	_GUICtrlListBox_BeginUpdate($idListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($idListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($idListBox)

	; Zeigt die Itemhöhe
	MsgBox($MB_SYSTEMMODAL, "Information", "Itemhöhe: " & _GUICtrlListBox_GetItemHeight($idListBox))

	; Setzt die Itemhöhe
	_GUICtrlListBox_SetItemHeight($idListBox, 26)

	; Zeigt die Itemhöhe
	MsgBox($MB_SYSTEMMODAL, "Information", "Itemhöhe: " & _GUICtrlListBox_GetItemHeight($idListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
