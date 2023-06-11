#include <MsgBoxConstants.au3>

Example()

Func Example()
	UDPStartup() ; Startet den UDP Service.

	; Registriert OnAutoItExit um es aufzurufen, wenn das Script beendet wird.
	OnAutoItExitRegister("OnAutoItExit")

	; Weist lokalen Variablen die loopback IP-Adresse (localhost) und den Port zu.
	Local $sIPAddress = "127.0.0.1" ; Diese IP-Adresse funktioniert nur am eigenen Computer.
	Local $iPort = 65532 ; Port welcher für die Verbindung verwendet wird.

	; Weist einer lokalen Variable den Socket zu und bindet das Script an die gegebene IP-Adresse und Port.
	Local $aSocket = UDPBind($sIPAddress, $iPort)

	; Wenn ein Fehler aufgetaucht ist, so wird dieser angezeigt und False zurückgegeben.
	If @error Then
		; Vielleicht lauscht bereits jemand auf dieser IP-Adresse und dem Port (läuft das Script bereits?).
		Local $iError = @error
		MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), "", "Konnte nicht lauschen, Error Code: " & $iError)
		Return False
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Lauschen erfolgreich.")
	EndIf

	; Schließt den gebundenen Socket damit er von anderen Anwendungen gebunden werden kann.
	; Solange dieser Socket nicht geschlossen ist kann er nicht von einem anderen Programm mit der selben IP-Adresse und Port gebunden werden.
	UDPCloseSocket($aSocket)
EndFunc   ;==>Example

Func OnAutoItExit()
	UDPShutdown() ; Schließt den UDP Service.
EndFunc   ;==>OnAutoItExit
