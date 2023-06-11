#include <ComboConstants.au3>
#include <Crypt.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

Example()

Func Example()
	Local $iAlgorithm = $CALG_RC4

	Local $hGui = GUICreate("Datei Entschlüsseln", 425, 100)
	Local $idSourceInput = GUICtrlCreateInput("", 5, 5, 200, 20)
	Local $idSourceBrowse = GUICtrlCreateButton("...", 210, 5, 35, 20)

	Local $idDestinationInput = GUICtrlCreateInput("", 5, 30, 200, 20)
	Local $idDestinationBrowse = GUICtrlCreateButton("...", 210, 30, 35, 20)

	GUICtrlCreateLabel("Passwort:", 5, 60, 200, 20)
	Local $idPasswordInput = GUICtrlCreateInput("", 5, 75, 200, 20)

	Local $idCombo = GUICtrlCreateCombo("", 210, 75, 100, 20, $CBS_DROPDOWNLIST)
	GUICtrlSetData($idCombo, "3DES (168bit)|AES (128bit)|AES (192bit)|AES (256bit)|DES (56bit)|RC2 (128bit)|RC4 (128bit)", "RC4 (128bit)")
	Local $idDecrypt = GUICtrlCreateButton("Entschlüsseln", 355, 70, 65, 25)
	GUISetState(@SW_SHOW, $hGui)

	Local $sDestinationRead = "", $sFilePath = "", $sPasswordRead = "", $sSourceRead = ""
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $idSourceBrowse
				$sFilePath = FileOpenDialog("Datei zum Entschlüsseln auswählen.", "", "Alle Dateien (*.*)") ; Datei zum Entschlüsseln auswählen.
				If @error Then
					ContinueLoop
				EndIf
				GUICtrlSetData($idSourceInput, $sFilePath) ; Pfad in der Inputbox anzeigen.

			Case $idDestinationBrowse
				$sFilePath = FileSaveDialog("Die Datei speichern als ...", "", "Alle Dateien (*.*)") ; Datei auswählen, um die entschlüsselten Daten zu speichern.
				If @error Then
					ContinueLoop
				EndIf
				GUICtrlSetData($idDestinationInput, $sFilePath) ; Pfad in der Inputbox anzeigen.

			Case $idCombo ; Status der Combobox abfragen und die ausgewählte Verschlüsselungsmethode empfangen.
				Switch GUICtrlRead($idCombo) ; Auslesen der Combobox.
					Case "3DES (168bit)"
						$iAlgorithm = $CALG_3DES

					Case "AES (128bit)"
						$iAlgorithm = $CALG_AES_128

					Case "AES (192bit)"
						$iAlgorithm = $CALG_AES_192

					Case "AES (256bit)"
						$iAlgorithm = $CALG_AES_256

					Case "DES (56bit)"
						$iAlgorithm = $CALG_DES

					Case "RC2 (128bit)"
						$iAlgorithm = $CALG_RC2

					Case "RC4 (128bit)"
						$iAlgorithm = $CALG_RC4

				EndSwitch

			Case $idDecrypt
				$sSourceRead = GUICtrlRead($idSourceInput) ; Quelldateipfad einlesen.
				$sDestinationRead = GUICtrlRead($idDestinationInput) ; Zieldateipfad einlesen.
				$sPasswordRead = GUICtrlRead($idPasswordInput) ; Passwort-Input auslesen.
				If StringStripWS($sSourceRead, $STR_STRIPALL) <> "" And StringStripWS($sDestinationRead, $STR_STRIPALL) <> "" And StringStripWS($sPasswordRead, $STR_STRIPALL) <> "" And FileExists($sSourceRead) Then ; Prüfen ob eine Datei und ein Passwort gegeben sind.
					If _Crypt_DecryptFile($sSourceRead, $sDestinationRead, $sPasswordRead, $iAlgorithm) Then ; Entschlüsseln der Datei.
						MsgBox($MB_SYSTEMMODAL, "Erfolgreich", "Verogang erfolgreich.")
					Else
						Switch @error
							Case 2
								MsgBox($MB_SYSTEMMODAL, "Fehler", "Quelldatei konnte nicht geöffnet werden.")
							Case 3
								MsgBox($MB_SYSTEMMODAL, "Fehler", "Zieldatei konnte nicht geöffnet werden.")
							Case 30
								MsgBox($MB_SYSTEMMODAL, "Fehler", "Erstellen des Schlüssels fehlgeschlagen.")
							Case 400 Or 500
								MsgBox($MB_SYSTEMMODAL, "Fehler", "Allgemeiner Entschlüsselungsfehler.")
							Case Else
								MsgBox($MB_SYSTEMMODAL, "Fehler", "Unerwarteter Fehler @error = " & @error)
						EndSwitch
					EndIf
				Else
					MsgBox($MB_SYSTEMMODAL, "Fehler", "Die angegebenen Information sind fehlerhaft.")
				EndIf
		EndSwitch
	WEnd

	GUIDelete($hGui) ; Löscht die vorherige GUI und alle Controls.
EndFunc   ;==>Example
