#include <Crypt.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	_Crypt_Startup() ; Vorheriges Starten der Crypt-Bibliothek für mehr Performance.

	Local Const $sUserKey = "CryptPassword" ; Ein Passwortstring deklarieren.
	Local $sData = "Es war einmal eine Programmiersprache ohne jegliche Standardisierung, die..." ; Ein String, der gehasht wird.

	Local $sOutput = "Im Folgenden sind die Ergebnisse von allen verfügbaren Algorithmen aufgelistet: " & @CRLF & @CRLF & _
			"Text: " & $sData & @CRLF & @CRLF & _
			"3DES (128bit): " & _Crypt_EncryptData($sData, $sUserKey, $CALG_3DES) & @CRLF & @CRLF & _
			"AES (128bit): " & _Crypt_EncryptData($sData, $sUserKey, $CALG_AES_128) & @CRLF & @CRLF & _
			"AES (192bit): " & _Crypt_EncryptData($sData, $sUserKey, $CALG_AES_192) & @CRLF & @CRLF & _
			"AES (256bit): " & _Crypt_EncryptData($sData, $sUserKey, $CALG_AES_256) & @CRLF & @CRLF & _
			"DES (56bit) : " & _Crypt_EncryptData($sData, $sUserKey, $CALG_DES) & @CRLF & @CRLF & _
			"RC2 (128bit): " & _Crypt_EncryptData($sData, $sUserKey, $CALG_RC2) & @CRLF & @CRLF & _
			"RC4 (128bit): " & _Crypt_EncryptData($sData, $sUserKey, $CALG_RC4)

	MsgBox($MB_SYSTEMMODAL, "Ergebnisse", $sOutput)

	_Crypt_Shutdown() ; Beenden der Crypt-Bibliothek
EndFunc   ;==>Example
