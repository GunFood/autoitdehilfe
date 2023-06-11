#include <ComboConstants.au3>
#include <Crypt.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StringConstants.au3>
#include <WinAPIConv.au3>
#include <WindowsConstants.au3>

Global $g_iAlgorithm = $CALG_SHA1, $g_idInputEdit = -1, $g_idOutputEdit = -1

Example()

Func Example()
	Local $hGui = GUICreate("Echtzeit Hashing", 400, 320)
	$g_idInputEdit = GUICtrlCreateEdit("", 0, 0, 400, 150, $ES_WANTRETURN)
	$g_idOutputEdit = GUICtrlCreateEdit("", 0, 150, 400, 150, $ES_READONLY)
	Local $idCombo = GUICtrlCreateCombo("", 0, 300, 100, 20, $CBS_DROPDOWNLIST)
	GUICtrlSetData($idCombo, "MD2 (128bit)|MD4 (128bit)|MD5 (128bit)|SHA1 (160bit)|SHA_256|SHA_384|SHA_512", "SHA1 (160bit)")
	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
	GUISetState(@SW_SHOW, $hGui)

	_Crypt_Startup() ; Startet die Crypt-Bibliothek um die Performance zu optimieren.

	Local $dHash = 0, _
			$sRead = ""
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $idCombo ; Checkbox-Status prüfen und aktuelle Verschlüsselungsart empfangen.
				Switch GUICtrlRead($idCombo) ; Combobox auslesen.
					Case "MD2 (128bit)"
						$g_iAlgorithm = $CALG_MD2

					Case "MD4 (128bit)"
						$g_iAlgorithm = $CALG_MD4

					Case "MD5 (128bit)"
						$g_iAlgorithm = $CALG_MD5

					Case "SHA1 (160bit)"
						$g_iAlgorithm = $CALG_SHA1

					Case "SHA_256"
						$g_iAlgorithm = $CALG_SHA_256

					Case "SHA_384"
						$g_iAlgorithm = $CALG_SHA_384

					Case "SHA_512"
						$g_iAlgorithm = $CALG_SHA_512
				EndSwitch

				$sRead = GUICtrlRead($g_idInputEdit)
				If StringStripWS($sRead, $STR_STRIPALL) <> "" Then ; Prüfen ob Text für den Hash vorhanden ist.
					$dHash = _Crypt_HashData($sRead, $g_iAlgorithm) ; Hash aus dem gegebenen Text erzeugen.
					GUICtrlSetData($g_idOutputEdit, $dHash) ; Hash im Output-Edit ausgeben.
				EndIf
		EndSwitch
	WEnd

	GUIDelete($hGui) ; Löscht die vorherige GUI und alle Controls.
	_Crypt_Shutdown() ; Beendet die Crypt-Bibliothek.
EndFunc   ;==>Example

Func WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $lParam

	Switch _WinAPI_LoWord($wParam)
		Case $g_idInputEdit
			Switch _WinAPI_HiWord($wParam)
				Case $EN_CHANGE
					Local $dHash = _Crypt_HashData(GUICtrlRead($g_idInputEdit), $g_iAlgorithm) ; Hash aus dem gegebenen Text erzeugen.
					GUICtrlSetData($g_idOutputEdit, $dHash) ; Hash im Output-Edit ausgeben.
			EndSwitch
	EndSwitch
EndFunc   ;==>WM_COMMAND
