#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI mit einem Edit-Control.
	Local $hGui = GUICreate("Beispiel")
	Local $idEdit = GUICtrlCreateEdit("Zeile 0" & @CRLF, 0, 0, 400, 350)
	Local $idButton_Ok = GUICtrlCreateButton("OK", 310, 370, 85, 25)

	; Setzt Daten des Edit-Controls.
	For $i = 1 To 25
		GUICtrlSetData($idEdit, "Zeile " & $i & @CRLF, 1)
	Next

	; Setzt den Fokus auf das Edit-Control.
	GUICtrlSetState($idEdit, $GUI_FOCUS)

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGui)

	; Initialisiert die Variable $aCtrlRecvMsg für das speichern des Wertes der von GUICtrlRecvMsg zurückgegeben wurde.
	Local $aCtrlRecvMsg = 0

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $idButton_Ok
				; Sendet die Nachricht EM_GETSEL um die aktuelle Markierung des Edit-Control zu empfangen.
				$aCtrlRecvMsg = GUICtrlRecvMsg($idEdit, $EM_GETSEL)

				; Setzt den Fokus auf das Edit-Control.
				GUICtrlSetState($idEdit, $GUI_FOCUS)

				; Falls GUICtrlRecvMsg 0 zurückgibt, so kommt ein Fehler. Sonst wird der Inhalt des Arrays angezeigt.
				If $aCtrlRecvMsg = 0 Then
					MsgBox($MB_SYSTEMMODAL, "", "Ein Fehler ist aufgetreten Der zurückgegebene Wert lautet - " & $aCtrlRecvMsg)
				Else
					MsgBox($MB_SYSTEMMODAL, "", "Start: " & $aCtrlRecvMsg[0] & " Ende: " & $aCtrlRecvMsg[1])
				EndIf

		EndSwitch
	WEnd

	; Löscht die vorherige GUI und alle Controls.
	GUIDelete($hGui)
EndFunc   ;==>Example
