#include <MsgBoxConstants.au3>

; Ich bin der Client, starte mich nach dem Server! (Starte zuerst das UDPSend/UDPRecv Beispielscript und wähle "1. Server").

Example()

Func Example()
	UDPStartup() ; Startet den UDP Service.

	; Registriert OnAutoItExit um es aufzurufen, wenn das Script beendet wird.
	OnAutoItExitRegister("OnAutoItExit")

	; Weist lokalen Variablen die loopback IP-Adresse (localhost) und den Port zu.
	Local $sIPAddress = "127.0.0.1" ; Diese IP-Adresse funktioniert nur am eigenen Computer.
	Local $iPort = 65532 ; Port welcher für die Verbindung verwendet wird.

	; Weist einer lokalen Variable den Socket zu und verbindet sich zu einem lauschenden Socket mit der gegebenen IP-Adresse und Port.
	Local $aSocket = UDPOpen($sIPAddress, $iPort)

	; Wenn ein Fehler aufgetaucht ist, so wird dieser angezeigt und False zurückgegeben.
	If @error Then
		Local $iError = @error
		MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), "", "Verbindung konnte nicht hergestellt werden, Error code: " & $iError)
		Return False
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Verbindung wurde erfolgreich hergestellt.")
	EndIf

	; Schließt den Socket.
	UDPCloseSocket($aSocket)
EndFunc   ;==>Example

Func OnAutoItExit()
	UDPShutdown() ; Schließt den UDP Service.
EndFunc   ;==>OnAutoItExit
