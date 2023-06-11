#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aRect, $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt das Rechteck, welches ein Item begrenzt", 400, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Strings hinzu
	_GUICtrlListBox_BeginUpdate($idListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($idListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($idListBox)

	; Zeigt das Rechteck, welches ein Item begrenzt
	$aRect = _GUICtrlListBox_GetItemRect($idListBox, 4)
	MsgBox(8256, "Information", "Rechteck des Items mit dem Index 5: " & @CRLF & @CRLF & "Linke Kante:" & @TAB & $aRect[0] & ", " & @CRLF & "Obere Kante:" & @TAB & $aRect[1] & ", " & @CRLF & "Breite:" & @TAB & @TAB & $aRect[2] & ", " & @CRLF & "Höhe:" & @TAB & @TAB & $aRect[3])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
