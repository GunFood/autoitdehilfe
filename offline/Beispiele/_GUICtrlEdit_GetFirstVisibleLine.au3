#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idEdit

	; Erstellt eine GUI
	GUICreate("Edit: Ermittelt die erste sichtbare Zeile", 400, 300)
	$idEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	For $x = 0 To 20
		_GUICtrlEdit_AppendText($idEdit, StringFormat("[%02d] An das Ende anhängen?", $x) & @CRLF)
	Next

	MsgBox($MB_SYSTEMMODAL, "Information", "Erste sichtbare Zeile: " & _GUICtrlEdit_GetFirstVisibleLine($idEdit))

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
