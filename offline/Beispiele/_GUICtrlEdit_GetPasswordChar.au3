#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("Edit: Setzt und ermittelt das Passwortzeichen (v" & @AutoItVersion & ")", 500, 300)
	Local $idEdit = GUICtrlCreateInput("Test des eingebauten PW-Eingabe-Controls", 2, 2, 394, 25, $ES_PASSWORD)
	GUISetState(@SW_SHOW)

	MsgBox(8192 + 64, "Information", "Passwortzeichen: " & _GUICtrlEdit_GetPasswordChar($idEdit))

	_GUICtrlEdit_SetPasswordChar($idEdit, "$") ; Ändert das Passwortzeichen in $

	MsgBox(8192 + 64, "Information", "Passwortzeichen: " & _GUICtrlEdit_GetPasswordChar($idEdit))

	_GUICtrlEdit_SetPasswordChar($idEdit) ; Zeigt die eingegebenen Zeichen im Klartext an

	MsgBox(8192 + 64, "Information", "Passwortzeichen: " & _GUICtrlEdit_GetPasswordChar($idEdit))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
