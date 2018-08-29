; *******************************************************
; Beispiel 1
; *******************************************************
;
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <FTPEx.au3>
#include <Misc.au3>

Opt('MustDeclareVars', 1)

_example1()
_example2()

#cs
	Beispiel mit externem Progressfenster zur Demostration der Fortschrittsanzeige mit einer Benutzerfunktion
#ce
Func _example1()
	Local $s_ServerName = 'ftp.csx.cam.ac.uk' ;das ist ein real existierender Server
	Local $s_Username = ''
	Local $s_Password = ''
	Local $i_Passive = 0 ;aktive Verbindung nutzen wenn bei anderen Server Probleme dann auch mit 1 für passive Verbung testen
	Local $l_InternetSession, $l_FTPSession
	Local $errOpen, $errFTP

	If FileExists(@TempDir & "\tmp.tmp") Then FileDelete(@TempDir & "\tmp.tmp") ;Nur um sicher zustellen dass das File nicht existiert

	$l_InternetSession = _FTP_Open('AuoItZilla') ;Öffnet eine FTP Sitzung
	$errOpen = @error
	If Not @error Then
		$l_FTPSession = _FTP_Connect($l_InternetSession, $s_ServerName, $s_Username, $s_Password, $i_Passive) ;Verbindet zu einem FTP Server
		$errFTP = @error
		If Not @error Then
			ProgressOn("Download", "Status:", "coded autoBert 2011")
			_FTP_ProgressDownload($l_FTPSession, @ScriptDir & "\tmp.tmp", "README", "_UpdateProgress")
			If @error Then ConsoleWrite("Fehler bei _FTP_ProgressDownload: " & @error)
			ProgressOff()
		Else
			MsgBox(0, "Connect", "fehlgeschlagen")
			ConsoleWrite("Connect: " & " " & $errFTP & @CRLF)
		EndIf
	Else
		MsgBox(0, "Open", "fehlgeschlagen")
		ConsoleWrite("Open " & " " & $errOpen & @CRLF)
	EndIf
	_FTP_Close($l_InternetSession)
EndFunc   ;==>_example1

Func _UpdateProgress($Prozent)
	ProgressSet($Prozent, $Prozent & "%")
	If _IsPressed("77") Then Return 0 ; Abbruch bei F8
	Return 1 ; bei 1 Fortsetzen
EndFunc   ;==>_UpdateProgress


Func _example2()
	#cs
		Beispiel mit eingebauter Fortschrittsanzeige von _FTP_ProgressDownload
	#ce
	Local $s_ServerName = 'ftp.csx.cam.ac.uk' ;das ist ein real exitierender Server
	Local $s_Username = ''
	Local $s_Password = ''
	Local $i_Passive = 0 ;aktive Verbindung nutzen wenn bei anderen Server Probleme dann ach mit 1 für passive Verbung testen
	Local $l_InternetSession, $l_FTPSession
	Local $errOpen, $errFTP

	If FileExists(@TempDir & "\tmp.tmp") Then FileDelete(@TempDir & "\tmp.tmp") ;Nur um sicher zustellen dass das File nicht existiert

	$l_InternetSession = _FTP_Open('AuoItZilla') ;Öffnet eine FTP Sitzung
	$errOpen = @error
	If Not @error Then
		$l_FTPSession = _FTP_Connect($l_InternetSession, $s_ServerName, $s_Username, $s_Password, $i_Passive) ;Verbindet zu einem FTP Server
		$errFTP = @error
		If Not @error Then
			_FTP_ProgressDownload($l_FTPSession, @ScriptDir & "\tmp.tmp", "README")
			If @error Then ConsoleWrite("Fehler bei _FTP_ProgressDownload: " & @error)
		Else
			MsgBox(0, "Connect", "fehlgeschlagen")
			ConsoleWrite("Connect: " & " " & $errFTP & @CRLF)
		EndIf
	Else
		MsgBox(0, "Open", "fehlgeschlagen")
		ConsoleWrite("Open " & " " & $errOpen & @CRLF)
	EndIf
	_FTP_Close($l_InternetSession)
EndFunc   ;==>_example2