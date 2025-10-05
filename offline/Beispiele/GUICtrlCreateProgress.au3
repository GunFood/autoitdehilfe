#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <ProgressConstants.au3>

Example()

Func Example()
	GUICreate("Meine GUI Progressbar", 220, 100, 100, 200)
	Local $idProgress_bar1 = GUICtrlCreateProgress(10, 10, 200, 20)
	GUICtrlSetColor(-1, 32250) ; Funktioniert nicht mit Windows XP Style
	Local $idProgress_bar2 = GUICtrlCreateProgress(10, 40, 200, 20, $PBS_SMOOTH)
	Local $idButton = GUICtrlCreateButton("Start", 75, 70, 70, 20)
	GUISetState(@SW_SHOW)

	Local $iWait = 20 ; Warte 20ms bis zum nächsten Schritt
	Local $iSavPos = 0 ; Progressbar-Startposition

	Local $idMsg, $idM
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
		$idMsg = GUIGetMsg()
		If $idMsg = $idButton Then
			GUICtrlSetData($idButton, "Stop")
			For $i = $iSavPos To 100
				If GUICtrlRead($idProgress_bar1) = 50 Then MsgBox($MB_SYSTEMMODAL, "Info", "Die Hälfte ist fertig ...", 1)

				$idM = GUIGetMsg()
				If $idM = $GUI_EVENT_CLOSE Then ExitLoop

				If $idM = $idButton Then
					GUICtrlSetData($idButton, "Weiter")
					$iSavPos = $i ; Speichere aktuelle Balkenposition in $iSavPos
					ExitLoop
				Else
					$iSavPos = 0
					GUICtrlSetData($idProgress_bar1, $i)
					GUICtrlSetData($idProgress_bar2, (100 - $i))
					Sleep($iWait)
				EndIf
			Next
			If $i > 100 Then
				GUICtrlSetData($idButton, "Start")
			EndIf
		EndIf
	Until $idMsg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
