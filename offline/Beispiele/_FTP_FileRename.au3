#region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#endregion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <FTPEx.au3>

Opt('MustDeclareVars', 1)

_example()

Func _example()
	;benennt eine Datei auf dem FTP-Server um
	Local $s_ServerName = 'guest.autobert.myplace.net' ;dieser Server existiert nicht
	Local $s_Username = "guest"
	Local $s_Password = "TopSecret"
	Local $i_Passive = 0 ;aktive Verbindung nutzen wenn bei anderen Server Probleme dann auch mit 1 für passive Verbung testen
	Local $s_OldName = "readme2.txt"
	Local $s_NewName = "readme.txt"
	Local $l_InternetSession, $l_FTPSession, $errOpen, $errFTP

	$l_InternetSession = _FTP_Open('AuoItZilla') ;Öffnet eine FTP Sitzung
	$errOpen = @error
	If Not @error Then
		$l_FTPSession = _FTP_Connect($l_InternetSession, $s_ServerName, $s_Username, $s_Password, $i_Passive) ;Verbindet zu einem FTP Server
		$errFTP = @error
		If Not @error Then
			_FTP_FileRename($l_FTPSession, $s_OldName, $s_NewName)
			If Not @error Then
				ConsoleWrite("FileRename: in Ordnung " & @CRLF)
			Else
				ConsoleWrite("FileRename: fehlgeschlagen " & " " & @error & @CRLF)
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