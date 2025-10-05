#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Fügt einen String ein", 400, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($WS_BORDER, $LBS_NOTIFY, $LBS_DISABLENOSCROLL, $WS_HSCROLL))
	GUISetState(@SW_SHOW)

	; Fügt Strings hinzu
	_GUICtrlListBox_BeginUpdate($idListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($idListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_InsertString($idListBox, "Fügt einen langen String hinzu, so das die horizontale Scrollbar erscheint und " & _
			"der ganze Text angezeigt werden kann.", 4)
	_GUICtrlListBox_UpdateHScroll($idListBox)
	_GUICtrlListBox_EndUpdate($idListBox)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
