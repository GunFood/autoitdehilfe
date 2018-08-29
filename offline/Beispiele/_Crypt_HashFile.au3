#include <ComboConstants.au3>
#include <Crypt.au3>
#include <GUIConstantsEx.au3>
#include <StringConstants.au3>

Example()

Func Example()
	Local $iAlgorithm = $CALG_SHA1

	Local $hGui = GUICreate("Datei Hash", 500, 100)
	Local $idInput = GUICtrlCreateInput(@ScriptFullPath, 5, 5, 200, 20)
	Local $idBrowse = GUICtrlCreateButton("...", 210, 5, 35, 20)
	Local $idCombo = GUICtrlCreateCombo("", 250, 5, 100, 20, $CBS_DROPDOWNLIST)
	GUICtrlSetData($idCombo, "MD2 (128bit)|MD4 (128bit)|MD5 (128bit)|SHA1 (160bit)|SHA_256 (256bit)|SHA_384 (384bit)|SHA_512 (512bit)", "SHA1 (160bit)")
	Local $idCalculate = GUICtrlCreateButton("Berechnen", 400, 40, 65, 25)
	Local $idHashLabel = GUICtrlCreateLabel("Hash", 5, 45, 350, 40)
	GUISetState(@SW_SHOW, $hGui)

	_Crypt_Startup() ; Startet die Crypt-Bibliothek um die Performance zu optimieren.

	Local $dHash = 0, _
			$sRead = ""
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $idBrowse
				Local $sFilePath = FileOpenDialog("Öffnen...", "", "Alle Dateien (*.*)") ; Datei zum hashen auswählen.
				If @error Then
					ContinueLoop
				EndIf
				GUICtrlSetData($idInput, $sFilePath) ; Dateipfad in Inputbox ausgeben.
				GUICtrlSetData($idHashLabel, "Hash") ; Label für Hash-Ouput zurücksetzen.

			Case $idCombo ; Status der Combobox abfragen und gewählte Methode empfangen.
				Switch GUICtrlRead($idCombo) ; Combobox auslesen.
					Case "MD2 (128bit)"
						$iAlgorithm = $CALG_MD2

					Case "MD4 (128bit)"
						$iAlgorithm = $CALG_MD4

					Case "MD5 (128bit)"
						$iAlgorithm = $CALG_MD5

					Case "SHA1 (160bit)"
						$iAlgorithm = $CALG_SHA1

					Case "SHA_256 (256bit)"
						$iAlgorithm = $CALG_SHA_256

					Case "SHA_384 (384bit)"
						$iAlgorithm = $CALG_SHA_384

					Case "SHA_512 (512bit)"
						$iAlgorithm = $CALG_SHA_512

				EndSwitch

			Case $idCalculate
				$sRead = GUICtrlRead($idInput)
				If StringStripWS($sRead, $STR_STRIPALL) <> "" And FileExists($sRead) Then ; Prüfen ob eine Datei angegeben ist.
					$dHash = _Crypt_HashFile($sRead, $iAlgorithm) ; Hash der Datei erstellen.
					GUICtrlSetData($idHashLabel, $dHash) ; Hash im Label ausgeben.
				EndIf
		EndSwitch
	WEnd

	GUIDelete($hGui) ; Löscht die vorherige GUI und alle Controls.
	_Crypt_Shutdown() ; Beendet die Crypt-Bibliothek.
EndFunc   ;==>Example
