#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("ListBox: Setzt und ermittelt die Itemhöhe (v" & @AutoItVersion & ")", 500, 296)
	Local $idListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Strings hinzu
	_GUICtrlListBox_BeginUpdate($idListBox)
	For $iI = 0 To 9
		_GUICtrlListBox_AddString($idListBox, StringFormat("%03d : String", $iI))
	Next
	_GUICtrlListBox_EndUpdate($idListBox)

	; Zeigt die Itemhöhe
	MsgBox($MB_SYSTEMMODAL, "Information", "Itemhöhe: " & _GUICtrlListBox_GetItemHeight($idListBox))

	; Setzt die Itemhöhe
	_GUICtrlListBox_SetItemHeight($idListBox, 26)

	; Zeigt die Itemhöhe
	MsgBox($MB_SYSTEMMODAL, "Information", "Itemhöhe: " & _GUICtrlListBox_GetItemHeight($idListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
