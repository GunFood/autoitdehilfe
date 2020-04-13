#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idEdit

	; Erstellt eine GUI
	GUICreate("Edit: Rückgängig machen", 400, 300)
	$idEdit = GUICtrlCreateEdit("Dies ist ein Test" & @CRLF & "Eine andere Zeile", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	_GUICtrlEdit_AppendText($idEdit, @CRLF & "An das Ende anhängen?")

	; Rückgängig machen
	MsgBox($MB_SYSTEMMODAL, "Information", "Die letzte Aktion wird nun rückgängig gemacht")
	_GUICtrlEdit_Undo($idEdit)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
