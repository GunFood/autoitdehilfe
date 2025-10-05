#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIError.au3>

; Zum starten zuerst auf "1. Server" klicken
; Dann durch "2. Client" eine zweite Instanz des Skripts starten

Example()

Func Example()
	TCPStartup() ; Startet den TCP Service.

	; Registriert OnAutoItExit um es aufzurufen, wenn das Script beendet wird.
	OnAutoItExitRegister("OnAutoItExit")

	; Weist lokalen Variablen die loopback IP-Adresse (localhost) und den Port zu.
	Local $sIPAddress = "127.0.0.1" ; Diese IP-Adresse funktioniert nur am eigenen Computer.
	Local $iPort = 65432 ; Port welcher für die Verbindung verwendet wird.

	#Region GUI
	Local $sTitle = "TCP Start"
	Local $hGUI = GUICreate($sTitle, 250, 70)

	Local $idBtn_Server = GUICtrlCreateButton("1. Server", 65, 10, 130, 22)

	Local $idBtn_Client = GUICtrlCreateButton("2. Client", 65, 40, 130, 22)

	GUISetState(@SW_SHOW, $hGUI)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idBtn_Server
				WinSetTitle($sTitle, "", "TCP Server gestartet")
				GUICtrlSetState($idBtn_Client, $GUI_HIDE)
				GUICtrlSetState($idBtn_Server, $GUI_DISABLE)
				If Not MyTCP_Server($sIPAddress, $iPort) Then ExitLoop
			Case $idBtn_Client
				WinSetTitle($sTitle, "", "TCP Client gestartet")
				GUICtrlSetState($idBtn_Server, $GUI_HIDE)
				GUICtrlSetState($idBtn_Client, $GUI_DISABLE)
				If Not MyTCP_Client($sIPAddress, $iPort) Then ExitLoop
		EndSwitch

		Sleep(10)
	WEnd

	#EndRegion GUI
EndFunc   ;==>Example


Func MyTCP_Client($sIPAddress, $iPort)
	; Weist einer lokalen Variable den Socket zu und verbindet sich zu einem lauschenden Socket mit der angegebenen IP-Adresse und Port.
	Local $iSocket = TCPConnect($sIPAddress, $iPort)
	Local $iError = 0

	; Wenn ein Fehler aufgetaucht ist, so wird dieser angezeigt und False zurückgegeben.
	If @error Then
		; Der Server ist vermutlich offline oder der Port wurde nicht am Server geöffnet.
		$iError = @error
		MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), "", "Client:" & @CRLF & "Verbindung konnte nicht hergestellt werden, Error Code: " & $iError & @CRLF & _WinAPI_GetErrorMessage($iError))
		Return False
	EndIf

	; Sendet den String "tata" konvertiert in die Binärrepräsentation zum Server.
	TCPSend($iSocket, StringToBinary("tata"))

	; Wenn ein Fehler aufgetaucht ist, so wird dieser angezeigt und False zurückgegeben.
	If @error Then
		$iError = @error
		MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), "", "Client:" & @CRLF & "Daten konnten nicht gesendet werden, Error Code: " & $iError & @CRLF & _WinAPI_GetErrorMessage($iError))
		Return False
	EndIf

	; Schließt den Socket.
	TCPCloseSocket($iSocket)
EndFunc   ;==>MyTCP_Client

Func MyTCP_Server($sIPAddress, $iPort)
	Local $aPos = WinGetPos("TCP Server gestartet")
	WinMove("TCP Server gestartet", "", $aPos[0], $aPos[1] - 100)
	; Weist einer lokalen Variable den Socket zu und bindet die angegebene IP-Adresse sowie Port mit einer maximalen Anzahl von 100 anstehenden Verbindungen.
	Local $iListenSocket = TCPListen($sIPAddress, $iPort, 100)
	Local $iError = 0

	If @error Then
		; Vielleicht lauscht bereits jemand auf dieser IP-Adresse und dem Port (läuft das Script bereits?).
		$iError = @error
		MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), "", "Server:" & @CRLF & "Kann nicht lauschen, Error Code: " & $iError & @CRLF & _WinAPI_GetErrorMessage($iError))
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
			MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), "", "Server:" & @CRLF & "Konnte die eingehende Verbindung nicht akzeptieren, Error Code: " & $iError & @CRLF & _WinAPI_GetErrorMessage($iError))
			Return False
		EndIf

		If GUIGetMsg() = $GUI_EVENT_CLOSE Then Return False
	Until $iSocket <> -1 ; Sollte sich dieser Wert von -1 unterscheiden so hat sich ein Client erfolgreich verbunden.

	; Schließt den gebundenen Socket damit er von anderen Anwendungen gebunden werden kann.
	TCPCloseSocket($iListenSocket)

	; Weist einer loaklen Variable die erhaltenen Daten zu.
	Local $sReceived = TCPRecv($iSocket, 4) ; Wir warten auf den String "tata" oder "toto" (Beispielscript TCPRecv): 4 Bytes lang.

	; Hinweis: Wenn man nicht weiß groß die ankommenden Daten sein werden, so kann man als Beispiel 2048 als maxlen-Parameter verwenden
	; und die Funktion solange aufrufen, bis sie nichts bzw. einen Error zurückgibt.

	; Zeigt den empfangenen String an.
	MsgBox($MB_SYSTEMMODAL, "", "Server:" & @CRLF & "Empfangen: " & $sReceived)

	; Schließt den Socket.
	TCPCloseSocket($iSocket)
EndFunc   ;==>MyTCP_Server

Func OnAutoItExit()
	TCPShutdown() ; Schließt den TCP Service.
EndFunc   ;==>OnAutoItExit

