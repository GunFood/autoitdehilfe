#include <MsgBoxConstants.au3>
#include <WinAPIError.au3>

Example()

Func Example()
	Local $sMsgBoxTitle = "AutoItVersion = " & @AutoItVersion

	TCPStartup() ; Startet den TCP Service.

	; Registriert OnAutoItExit um es aufzurufen, wenn das Script beendet wird.
	OnAutoItExitRegister("OnAutoItExit")

	; Weist lokalen Variablen die loopback IP-Adresse (localhost) und den Port zu.
	Local $sIPAddress = "127.0.0.1" ; Diese IP-Adresse funktioniert nur am eigenen Computer.
	Local $iPort = 65432 ; Port welcher für die Verbindung verwendet wird.

	; Bindet das Script an die IP-Adresse und zum Port mit einer maximalen Anzahl von 100 anstehenden Verbindungen.
	; (Siehe das Beispiel für diese Funktion für weitere Details).
	Local $iListenSocket = TCPListen($sIPAddress, $iPort, 100)

	; Hinweis: Es kann nur auf privaten IPs gelauscht werden, wie z.B. die hier benutzten;
	; oder die in der Spanne von 192 bis 223 (meistens 192.168.X.X, es ist @IPAddress1 zu verwenden um die lokale IP zu testen (ein zweiter Computer wird benötigt).
	; Der Lauscher Socket wird nur für die TCPAccept-Funktion und zum Schließen mittels TCPCloseSocket verwendet.

	; Wenn ein Fehler aufgetaucht ist, so wird dieser angezeigt und False zurückgegeben.
	If @error Then
		; Vielleicht lauscht bereits jemand auf dieser IP-Adresse und dem Port (läuft das Script bereits?).
		MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), "", "Konnte nicht lauschen, Error Code: " & @error & @CRLF & @CRLF & _WinAPI_GetErrorMessage(@error))
		Return False
	Else
		MsgBox($MB_SYSTEMMODAL, $sMsgBoxTitle, "Lauschen erfolgreich.", 3)
	EndIf

	; Schließt den gebundenen Socket damit er von anderen Anwendungen gebunden werden kann.
	; Solange dieser Socket nicht geschlossen ist kann er nicht von einem anderen Programm mit der selben IP-Adresse und Port gebunden werden.
	TCPCloseSocket($iListenSocket)
EndFunc   ;==>Example

Func OnAutoItExit()
	TCPShutdown() ; Schließt den TCP Service.
EndFunc   ;==>OnAutoItExit
