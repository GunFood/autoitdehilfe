#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sText, $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Textlänge ermitteln", 400, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($LBS_STANDARD, $LBS_EXTENDEDSEL))
	GUISetState(@SW_SHOW)

	; Fügt Strings hinzu
	_GUICtrlListBox_BeginUpdate($idListBox)
	For $iI = 1 To 9
		$sText = StringFormat("%03d : Zufallstring ", Random(1, 100, 1))
		For $iX = 1 To Random(1, 20, 1)
			$sText &= Chr(Random(65, 90, 1))
		Next
		_GUICtrlListBox_AddString($idListBox, $sText)
	Next
	_GUICtrlListBox_EndUpdate($idListBox)

	; Zeigt die Itemtextlänge
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 5 Textlänge: " & _GUICtrlListBox_GetTextLen($idListBox, 4))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
