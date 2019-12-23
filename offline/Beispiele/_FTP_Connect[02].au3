;
#include <FTPEx.au3>
#include <Misc.au3>
#include <Constants.au3>

_example1()

#cs
	Beispiel mit externem Progressfenster zur Demonstration der Fortschrittsanzeige mit einer Benutzerfunktion
#ce
Func _example1()
	Local $s_ServerName = 'ftp.csx.cam.ac.uk' ;das ist ein real existierender Server
	Local $s_Username = ''
	Local $s_Password = ''
	Local $i_Passive = 0 ;aktive Verbindung nutzen wenn bei anderen Server Probleme dann auch mit 1 für passive Verbung testen
	Local $l_InternetSession, $l_FTPSession
	Local $errOpen, $errFTP

	If FileExists(@TempDir & "\tmp.tmp") Then FileDelete(@TempDir & "\tmp.tmp") ;Nur um sicherzustellen dass die Datei nicht existiert

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
			MsgBox($MB_OK, "Connect", "fehlgeschlagen")
			ConsoleWrite("Connect: " & " " & $errFTP & @CRLF)
		EndIf
	Else
		MsgBox($MB_OK, "Open", "fehlgeschlagen")
		ConsoleWrite("Open " & " " & $errOpen & @CRLF)
	EndIf
	_FTP_Close($l_InternetSession)
EndFunc   ;==>_example1

Func _UpdateProgress($Prozent)
	ProgressSet($Prozent, $Prozent & "%")
	If _IsPressed("77") Then Return 0 ; Abbruch bei F8
	Return 1 ; bei 1 fortsetzen
EndFunc   ;==>_UpdateProgress
