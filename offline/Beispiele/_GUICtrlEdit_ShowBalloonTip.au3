#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>

Example()

Func Example()
	Local $idEdit, $sTitle = "ShowBalloonTip", $sText = "Zeigt einen Balloontip, der mit einem Edit-Control verbunden ist."

	; Erstellt eine GUI
	GUICreate("Edit: Zeigt einen Balloontip", 400, 300)
	$idEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt den Text
	_GUICtrlEdit_SetText($idEdit, "Dies ist ein Text" & @CRLF & "Eine andere Zeile" & @CRLF & "An das Ende anhängen?")

	_GUICtrlEdit_ShowBalloonTip($idEdit, $sTitle, $sText, $TTI_INFO)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
