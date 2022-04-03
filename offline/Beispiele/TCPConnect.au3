#include <MsgBoxConstants.au3>
#include <WinAPIError.au3>

; Ich bin der Client, starte mich nach dem Server! (Starte zuerst das TCPAccept Beispielscript).

Example()

Func Example()
	TCPStartup() ; Startet den TCP Service.

	; Registriert OnAutoItExit um es aufzurufen, wenn das Script beendet wird.
	OnAutoItExitRegister("OnAutoItExit")

	; Weist lokalen Variablen die loopback IP-Adresse (localhost) und den Port zu.
	Local $sIPAddress = "127.0.0.1" ; Diese IP-Adresse funktioniert nur am eigenen Computer.
	Local $iPort = 65432 ; Port welcher für die Verbindung verwendet wird.

	; Weist einer lokalen Variable den Socket zu und verbindet sich zu einem lauschenden Socket mit der gegebenen IP-Adresse und Port.
	Local $iSocket = TCPConnect($sIPAddress, $iPort)

	; Wenn ein Fehler aufgetaucht ist, so wird dieser angezeigt und False zurückgegeben.
	If @error Then
		; Der Server ist vermutlich offline oder der Port wurde nicht am Server geöffnet.
		Local $iError = @error
		MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), "", "Verbindung konnte nicht hergestellt werden, Error Code: " & $iError & @CRLF & _WinAPI_GetErrorMessage($iError))
		Return False
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Verbindung wurde erfolgreich hergestellt.")
	EndIf

	; Schließt den Socket.
	TCPCloseSocket($iSocket)
EndFunc   ;==>Example

Func OnAutoItExit()
	TCPShutdown() ; Schließt den TCP Service.
EndFunc   ;==>OnAutoItExit
