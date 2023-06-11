#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui, $idEdit

	; Erstellt eine GUI
	$hGui = GUICreate("Edit: löschen", 400, 300)
	$idEdit = _GUICtrlEdit_Create($hGui, "Dies ist ein Test" & @CRLF & "eine andere Zeile", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	_GUICtrlEdit_AppendText($idEdit, @CRLF & "An das Ende anhängen?")

	MsgBox($MB_SYSTEMMODAL, "Information", "Das Edit-Control wird gelöscht")
	_GUICtrlEdit_Destroy($idEdit)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
