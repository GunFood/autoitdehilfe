#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

; Zum starten zuerst auf "1. Server" klicken
; Dann durch "2. Client" eine zweite Instanz des Skripts starten

Example()

Func Example()
	UDPStartup() ; Startt den UDP Service.

	; Registriert OnAutoItExit um es aufzurufen, wenn das Script beendet wird.
	OnAutoItExitRegister("OnAutoItExit")

	; Weist lokalen Variablen die loopback IP-Adresse (localhost) und den Port zu.
	Local $sIPAddress = "127.0.0.1" ; Diese IP-Adresse funktioniert nur am eigenen Computer.
	Local $iPort = 65532 ; Port welcher für die Verbindung verwendet wird.

	#Region GUI
	Local $sTitle = "TCP Start"
	Local $hGUI = GUICreate("TCPSend", 250, 70)

	Local $idBtnServer = GUICtrlCreateButton("1. Server", 10, 10, 130, 22)

	Local $idBtnClient = GUICtrlCreateButton("2. Client", 10, 40, 130, 22)

	GUISetState(@SW_SHOW, $hGUI)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idBtnServer
				WinSetTitle($sTitle, "", "TCP Server gestarted")
				GUICtrlSetState($idBtnClient, $GUI_HIDE)
				GUICtrlSetState($idBtnServer, $GUI_DISABLE)
				If Not MyUDP_Server($sIPAddress, $iPort) Then ExitLoop
			Case $idBtnClient
				WinSetTitle($sTitle, "", "TCP Client gestarted")
				GUICtrlSetState($idBtnServer, $GUI_HIDE)
				GUICtrlSetState($idBtnClient, $GUI_DISABLE)
				If Not MyUDP_Client($sIPAddress, $iPort) Then ExitLoop
		EndSwitch

		Sleep(10)
	WEnd

	#EndRegion GUI
EndFunc   ;==>Example

Func MyUDP_Server($sIPAddress, $iPort)
	; Weist einer lokalen Variable den Socket zu und bindet die angegebene IP-Adresse und Port.
	Local $iSocket = UDPBind($sIPAddress, $iPort)

	; Wenn ein Fehler aufgetaucht ist, so wird dieser angezeigt und False zurückgegeben.
	If @error Then
		; Vielleicht lauscht bereits jemand auf dieser IP-Adresse und dem Port (läuft das Script bereits?).
		Local $iError = @error
		MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), "", "Server:" & @CRLF & "Konnte nicht lauschen, Error Code: " & $iError)
		Return False
	EndIf

	; Initialisiert eine lokale Variable um die empfangenen Daten abzuspeichern.
	Local $sReceived = ""

	Do
		; Es wird auf den String "tata" oder "toto" gewartet (Beispielscript UDPSend): 4 Bytes lang.
		$sReceived = UDPRecv($iSocket, 4)
	Until $sReceived <> ""

	; Hinweis: Wenn man nicht weiß groß die ankommenden Daten sein werden, so kann man als Beispiel 2048 als maxlen-Parameter verwenden
	; und die Funktion solange aufrufen, bis sie nichts bzw. einen Error zurückgibt.

	; Zeigt den empfangenen String an.
	MsgBox($MB_SYSTEMMODAL, "", "Server:" & @CRLF & "Empfangen: " & $sReceived)

	; Schließt den Socket.
	UDPCloseSocket($iSocket)
EndFunc   ;==>MyUDP_Server

Func MyUDP_Client($sIPAddress, $iPort)
	; Weist einer lokalen Variable den Socket zu und verbindet sich zu einem lauschenden Socket mit der angegebenen IP-Adresse und Port.
	Local $iSocket = UDPOpen($sIPAddress, $iPort)
	Local $iError = 0

	; Wenn ein Fehler aufgetaucht ist, so wird dieser angezeigt und False zurückgegeben.
	If @error Then
		; Der Server ist vermutlich offline oder der Port wurde nicht am Server geöffnet.
		$iError = @error
		MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), "", "Client:" & @CRLF & "Verbindung konnte nicht hergestellt werden, Error Code: " & $iError)
		Return False
	EndIf

	; Sendet den String "toto" konvertiert in die Binärrepräsentation zum Server.
	UDPSend($iSocket, StringToBinary("toto"))

	; Wenn ein Fehler aufgetaucht ist, so wird dieser angezeigt und False zurückgegeben.
	If @error Then
		$iError = @error
		MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), "", "Client:" & @CRLF & "Daten konnten nicht gesendet werden, Error Code: " & $iError)
		Return False
	EndIf

	; Schließt den Socket.
	UDPCloseSocket($iSocket)
EndFunc   ;==>MyUDP_Client

Func OnAutoItExit()
	UDPShutdown() ; Schließt den UDP Service.
EndFunc   ;==>OnAutoItExit
