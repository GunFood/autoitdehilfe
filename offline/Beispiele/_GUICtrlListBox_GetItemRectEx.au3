#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $tRECT, $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt das Rechteck, welches ein Item begrenzt", 500, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Strings hinzu
	_GUICtrlListBox_BeginUpdate($idListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($idListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($idListBox)

	; Zeigt das Rechteck, welches ein Item begrenzt
	$tRECT = _GUICtrlListBox_GetItemRectEx($idListBox, 4)
	MsgBox($MB_SYSTEMMODAL, "Information", "Rechteck von Item 5: " & _
			DllStructGetData($tRECT, "Left") & ", " & _
			DllStructGetData($tRECT, "Top") & ", " & _
			DllStructGetData($tRECT, "Right") & ", " & _
			DllStructGetData($tRECT, "Bottom"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
