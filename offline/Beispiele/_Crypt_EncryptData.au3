#include <ComboConstants.au3>
#include <Crypt.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <WinAPIConv.au3>
#include <WindowsNotifsConstants.au3>

Global $g_hKey = -1, $g_idEdt_Input = -1, $g_idEdt_Output = -1, $g_idEdt_OutputDeCrypted = -1

Example()

Func Example()
	Local $hGui = GUICreate("Echtzeit Ent- und Verschlüsselung", 400, 470)
	$g_idEdt_Input = GUICtrlCreateEdit("", 0, 0, 400, 150, $ES_WANTRETURN)
	$g_idEdt_Output = GUICtrlCreateEdit("", 0, 150, 400, 150, $ES_READONLY)
	$g_idEdt_OutputDeCrypted = GUICtrlCreateEdit("", 0, 300, 400, 150, $ES_READONLY)
	Local $idCombo = GUICtrlCreateCombo("", 0, 450, 100, 20, $CBS_DROPDOWNLIST)
	GUICtrlSetData($idCombo, "3DES (168bit)|AES (128bit)|AES (192bit)|AES (256bit)|DES (56bit)|RC2 (128bit)|RC4 (128bit)", "RC4 (128bit)")
	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
	GUISetState(@SW_SHOW, $hGui)

	_Crypt_Startup() ; Startet die Crypt-Bibliothek um die Performance zu optimieren.

	Local $iAlgorithm = $CALG_RC4
	$g_hKey = _Crypt_DeriveKey(StringToBinary("CryptPassword"), $iAlgorithm) ; Deklariert eine Passwort-Zeichenkette und einen Algorithmus um einen kryptographischen Schlüssel zu erzeugen.

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				Exit

			Case $idCombo ; Prüft, wann die Combobox ausgewählt ist und ruft den richtigen Algorithmus ab.
				Switch GUICtrlRead($idCombo) ; Liest das ausgewählte Element der Combobox aus.
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

				_Crypt_DestroyKey($g_hKey) ; Zerstört den kryptographischen Schlüssel.
				$g_hKey = _Crypt_DeriveKey(StringToBinary("CryptPassword"), $iAlgorithm) ; Deklariert wieder eine Passwort-Zeichenkette und einen Algorithmus um einen neuen kryptographischen Schlüssel zu erzeugen.

				Local $sRead = GUICtrlRead($g_idEdt_Input)
				If StringStripWS($sRead, $STR_STRIPALL) <> "" Then ; Prüft, ob ein Text zum Verschlüssen vorhanden ist.
					Local $dEncrypted = _Crypt_EncryptData($sRead, $g_hKey, $CALG_USERKEY) ; Verschlüsselt den Text mit dem neuen kryptographischen Schlüssel.
					GUICtrlSetData($g_idEdt_Output, $dEncrypted) ; Gibt den verschlüsselten Text in dem Ausgabe-Editfeld aus.
					Local $dDecrypted = _Crypt_DecryptData($dEncrypted, $g_hKey, $CALG_USERKEY) ; Entschlüsselt den Text mit dem neuen kryptographischen Schlüssel.
					GUICtrlSetData($g_idEdt_OutputDeCrypted, BinaryToString($dDecrypted)) ; Gibt den entschlüsselten Text in dem Ausgabe-Editfeld aus.

				EndIf
		EndSwitch
	WEnd

	GUIDelete($hGui) ; Löscht die vorherige GUI und alle Controls.
	_Crypt_DestroyKey($g_hKey) ; Zerstört den kryptographischen Schlüssel.
	_Crypt_Shutdown() ; Beendet die Crypt-Bibliothek.
EndFunc   ;==>Example

Func WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $lParam

	Switch _WinAPI_LoWord($wParam)
		Case $g_idEdt_Input
			Switch _WinAPI_HiWord($wParam)
				Case $EN_CHANGE
					Local $dEncrypted = _Crypt_EncryptData(GUICtrlRead($g_idEdt_Input), $g_hKey, $CALG_USERKEY) ; Verschlüsselt den Text mit dem kryptographischem Schlüssel.
					GUICtrlSetData($g_idEdt_Output, $dEncrypted) ; Gibt den verschlüsselten Text in dem Ausgabe-Editfeld aus.
					Local $dDecrypted = _Crypt_DecryptData($dEncrypted, $g_hKey, $CALG_USERKEY) ; Entschlüsselt den Text mit dem kryptographischem Schlüssel.
					GUICtrlSetData($g_idEdt_OutputDeCrypted, BinaryToString($dDecrypted)) ; Gibt den entschlüsselten Text in dem Ausgabe-Editfeld aus.

			EndSwitch
	EndSwitch
EndFunc   ;==>WM_COMMAND
