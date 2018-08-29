#include <Crypt.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	_Crypt_Startup() ; Vorheriges Starten der Crypt-Bibliothek für mehr Performance.

	Local $sData = "...war einmal eine Programmiersprache ohne kryptografische Funktionen. Jetzt gibt es sie nicht mehr." ; Datenstring zum hashen.

	Local $sOutput = "Im Folgenden sind die Ergebnisse von allen verfügbaren Algorithmen aufgeslistet: " & @CRLF & @CRLF & _
			"Text: " & $sData & @CRLF & @CRLF & _
			"MD2 (128bit): " & _Crypt_HashData($sData, $CALG_MD2) & @CRLF & @CRLF & _
			"MD4 (128bit): " & _Crypt_HashData($sData, $CALG_MD4) & @CRLF & @CRLF & _
			"MD5 (128bit): " & _Crypt_HashData($sData, $CALG_MD5) & @CRLF & @CRLF & _
			"SHA1 (160bit): " & _Crypt_HashData($sData, $CALG_SHA1) & @CRLF & @CRLF & _
			"SHA_256: " & _Crypt_HashData($sData, $CALG_SHA_256) & @CRLF & @CRLF & _
			"SHA_384: " & _Crypt_HashData($sData, $CALG_SHA_384) & @CRLF & @CRLF & _
			"SHA_512: " & _Crypt_HashData($sData, $CALG_SHA_512)

	MsgBox($MB_SYSTEMMODAL, "Ergebnisse", $sOutput)

	_Crypt_Shutdown() ; Beenden der Crypt-Bibliothek
EndFunc   ;==>Example
