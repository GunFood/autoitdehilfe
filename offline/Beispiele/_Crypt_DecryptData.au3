#include <Crypt.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local Const $sUserKey = "CryptPassword" ; Deklariert eine Passwort-Zeichenfolge um die Daten zu ver- und entschlüsseln.
	Local $sData = "...vor einer Zeit gab es eine Sprache mit nicht-standardisierten Kryptographie-Funktionen. Diese Sprache gibt es nicht mehr." ; Dieser Text wird verschlüsselt werden.

	Local $bEncrypted = _Crypt_EncryptData($sData, $sUserKey, $CALG_RC4) ; Verschlüsselt den Text mit Hilfe der generischen Passwort-Zeichenfolge.

	$bEncrypted = _Crypt_DecryptData($bEncrypted, $sUserKey, $CALG_RC4) ; Entschlüsselt den Text mit Hilfe der generischen Passwort-Zeichenfolge. Der Rückgabewert ist ein Binärstring.
	MsgBox($MB_SYSTEMMODAL, "Entschlüsselter Text", BinaryToString($bEncrypted)) ; Konvertiert den Binärstring mit Hilfe BinaryToString um den Ausgangstext anzuzeigen, den wir verschlüsselten.
EndFunc   ;==>Example
