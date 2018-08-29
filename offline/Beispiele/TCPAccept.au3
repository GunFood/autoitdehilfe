#include <MsgBoxConstants.au3>

; Ich bin der Server, starte mich zuerst! (Startet danach das TCPConnect Beispielscript).

Example()

Func Example()
	TCPStartup() ; Startet den TCP Service.

	; Registriert OnAutoItExit um es aufzurufen, wenn das Script beendet wird.
	OnAutoItExitRegister("OnAutoItExit")

	; Weist lokalen Variablen die loopback IP-Adresse (localhost) und den Port zu.
	Local $sIPAddress = "127.0.0.1" ; Diese IP-Adresse funktioniert nur am eigenen Computer.
	Local $iPort = 65432 ; Port welcher für die Verbindung verwendet wird.

	; Bindet das Script an die IP-Adresse und zum Port mit einer maximalen Anzahl von 100 anstehenden Verbindungen.
	; (Siehe das Beispiel für diese Funktion für weitere Details).
	Local $iListenSocket = TCPListen($sIPAddress, $iPort, 100)
	Local $iError = 0

	; Wenn ein Fehler aufgetaucht ist, so wird dieser angezeigt und False zurückgegeben.
	If @error Then
		; Vielleicht lauscht bereits jemand auf dieser IP-Adresse und dem Port (läuft das Script bereits?).
		$iError = @error
		MsgBox(BitOR($MB_SYSTEMMODAL, $MB_ICONHAND), "", "Es konnte nicht gelauscht werden, Error Code: " & $iError)
		Return False
	EndIf

	; Initialisiert eine lokale Variable um sie als Clientsocket zu nutzen.
	Local $iSocket = 0
	Do ; Wartet solange bis sich jemand verbindet (Unbegrenzt).
		; Akzeptiert eingehende Verbindungen sofern präsent (Socket wird geschlossen wenn die Aufgabe abgeschlossen wurde; Ein Socket pro Client).
		$iSocket = TCPAccept($iListenSocket)

		; Wenn ein Fehler aufgetaucht ist, so wird dieser angezeigt und False zurückgegeben.
		If @error Then
			$iError = @error
			MsgBox(BitOR($MB_SYSTEMMODAL, $MB_ICONHAND), "", "Die eingehende Verbindung wurde nicht akzeptiert, Error Code: " & $iError)
			Return False
		EndIf
	Until $iSocket <> -1 ; Sollte sich dieser Wert von -1 unterscheiden so hat sich ein Client erfolgreich verbunden.

	; Schließt den gebundenen Socket damit er von anderen Anwendungen gebunden werden kann.
	TCPCloseSocket($iListenSocket)

	MsgBox($MB_SYSTEMMODAL, "", "Client hat sich erfolgreich verbunden.")

	; Schließt den Socket.
	TCPCloseSocket($iSocket)
EndFunc   ;==>Example

Func OnAutoItExit()
	TCPShutdown() ; Schließt den TCP Service.
EndFunc   ;==>OnAutoItExit
