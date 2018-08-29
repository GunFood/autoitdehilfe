#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>

Example()

Func Example()
	Local $hGui, $idEdit, $sTitle = "ShowBalloonTip", $sText = "Zeigt einen Balloontip, der mit einem Edit-Control verbunden ist"

	; Erstellt eine GUI
	$hGui = GUICreate("Edit: Versteckt einen Balloontip", 400, 300)
	$idEdit = _GUICtrlEdit_Create($hGui, "", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt den Text
	_GUICtrlEdit_SetText($idEdit, "Dies ist ein Text" & @CRLF & "Eine andere Zeile" & @CRLF & "An das Ende anhängen?" & @CRLF & @CRLF)

	_GUICtrlEdit_ShowBalloonTip($idEdit, $sTitle, $sText, $TTI_INFO)
	Sleep(1000)
	Local $bBalloon = _GUICtrlEdit_HideBalloonTip($idEdit)
	_GUICtrlEdit_AppendText($idEdit, "BalloonTip verstecken= " & $bBalloon & @CRLF)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
