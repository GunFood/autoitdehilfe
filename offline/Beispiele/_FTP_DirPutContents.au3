#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <FTPEx.au3>

Opt('MustDeclareVars', 1)

_example()

Func _example()
	Local $s_ServerName = 'guest.autobert.myplace.net' ;dieser Server existiert nicht
	Local $s_Username = "guest"
	Local $s_Password = "TopSecret"

	Local $s_LocalFile = @ScriptDir & "\ReadMeTest.txt"
	Local $s_RemoteFile = "/FTPTestfiles/_FTP_FilePut.au3"
	Local $i_Passive = 0
	Local $l_InternetSession, $l_FTPSession, $errOpen, $errFTP

	$l_InternetSession = _FTP_Open('AuoItZilla') ;Öffnet eine FTP Sitzung
	$errOpen = @error
	If Not @error Then
		$l_FTPSession = _FTP_Connect($l_InternetSession, $s_ServerName, $s_Username, $s_Password, $i_Passive) ;Verbindet zu einem FTP Server
		$errFTP = @error
		If Not @error Then
			If _FTP_FilePut($l_FTPSession, $s_LocalFile, $s_RemoteFile) Then
				ConsoleWrite("Upload: erfolgreich" & @CRLF)
			Else
				ConsoleWrite("Upload: fehlgeschlagen " & " " & @error & @CRLF)
			EndIf
		Else
			MsgBox(0, "Connect", "fehlgeschlagen")
			ConsoleWrite("Connect: " & " " & $errFTP & @CRLF)
		EndIf
	Else
		MsgBox(0, "Open", "fehlgeschlagen")
		ConsoleWrite("Open " & " " & $errOpen & @CRLF)
	EndIf
	_FTP_Close($l_InternetSession) ;schliesst die FTP-Sitzng
EndFunc   ;==>_example