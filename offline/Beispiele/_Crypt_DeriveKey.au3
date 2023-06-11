#include <Crypt.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aStringsToEncrypt[6] = ["AutoIt", "SciTE", "Crypt", ".au3", 42, "42"]
	Local $sOutput = ""

	Local $hKey = _Crypt_DeriveKey("CryptPassword", $CALG_RC4) ; Ein Passwort und eine Verschlüsselungsmethode angeben um den kryptografischen Schlüssel zu generieren.

	For $vText In $aStringsToEncrypt
		$sOutput &= $vText & @TAB & " = " & _Crypt_EncryptData($vText, $hKey, $CALG_USERKEY) & @CRLF ; Text mit dem erzeugten Schlüssel verschlüsseln.
	Next

	MsgBox($MB_SYSTEMMODAL, "Verschlüsselte Daten", $sOutput)

	_Crypt_DestroyKey($hKey) ; Löschen des Schlüssels.
EndFunc   ;==>Example
