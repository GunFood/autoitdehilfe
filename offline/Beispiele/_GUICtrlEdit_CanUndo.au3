#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idEdit

	; Erstellt eine GUI
	GUICreate("Edit: Undo aktivieren", 400, 300)
	$idEdit = GUICtrlCreateEdit("Dies ist ein Test" & @CRLF & "Eine andere Zeile", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	MsgBox($MB_SYSTEMMODAL, "Information", "Undo aktivieren: " & _GUICtrlEdit_CanUndo($idEdit))

	_GUICtrlEdit_AppendText($idEdit, @CRLF & "An das Ende anhängen?")

	MsgBox($MB_SYSTEMMODAL, "Information", "Undo aktivieren: " & _GUICtrlEdit_CanUndo($idEdit))

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
