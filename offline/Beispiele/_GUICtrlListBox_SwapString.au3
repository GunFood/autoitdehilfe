#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $sText, $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: String tauschen", 400, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($WS_BORDER, $WS_VSCROLL, $LBS_NOTIFY, $LBS_MULTIPLESEL))
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

	; Vertauscht den Text zweier Items bei den festgelegten Indizes
	MsgBox($MB_SYSTEMMODAL, "Information", "Tauscht Strings (3:5)")
	_GUICtrlListBox_SwapString($idListBox, 3, 5)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
