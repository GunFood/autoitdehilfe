#include "FTPEx.au3"

;~ Local $sServer = 'ftp.cs.brown.edu' ; Brown Computer Science
Local $sServer = 'speedtest.tele2.net' ; Tele2 Speedtest Service
Local $sUsername = ''
Local $sPass = ''

Local $hOpen = _FTP_Open('MyFTP Control')
Local $hConn = _FTP_Connect($hOpen, $sServer, $sUsername, $sPass)

;~ Local $sRemoteDir = "/pub/papers/graphics/research/"
Local $sRemoteDir = "/"
Local $h_Handle
Local $aFile = _FTP_FindFileFirst($hConn, $sRemoteDir, $h_Handle)
ConsoleWrite('$sFileName = ' & $aFile[10] & ' attribute = ' & $aFile[1] & '  -> Fehlercode: ' & @error & ' extended: ' & @extended & @CRLF)

Local $sDirset = _FTP_DirSetCurrent($hConn, $sRemoteDir)
ConsoleWrite('$sDirset = ' & $sDirset & '  -> Fehlercode: ' & @error & ' extended: ' & @extended & @CRLF)

Local $iFileSize = _FTP_FileGetSize($hConn, $aFile[10])
ConsoleWrite('$sFileName = ' & $aFile[10] & ' size = ' & $iFileSize & '  -> Fehlercode: ' & @error & ' extended: ' & @extended & @CRLF)

Local $Err, $Message
$iFileSize = _FTP_GetLastResponseInfo($Err, $Message) ; error =  Contrib: Keine reguläre Datei
ConsoleWrite('$Message = ' & $Message & ' err = ' & $Err & '  -> Fehlercode: ' & @error & ' extended: ' & @extended & @CRLF)

$aFile = _FTP_FindFileNext($h_Handle)
ConsoleWrite('$sFileNameNext1 = ' & $aFile[10] & ' attribute = ' & $aFile[1] & '  -> Fehlercode: ' & @error & ' extended: ' & @extended & @CRLF)

$iFileSize = _FTP_FileGetSize($hConn, $aFile[10])
ConsoleWrite('$sFileNameNext1 = ' & $aFile[10] & ' size = ' & $iFileSize & '  -> Fehlercode: ' & @error & ' extended: ' & @extended & @CRLF)

$iFileSize = _FTP_GetLastResponseInfo($Err, $Message) ; kein Fehler
ConsoleWrite('$Message = ' & $Message & ' err = ' & $Err & '  -> Fehlercode: ' & @error & ' extended: ' & @extended & @CRLF)

Local $iFindClose = _FTP_FindFileClose($h_Handle)

Local $iFtpc = _FTP_Close($hConn)
Local $iFtpo = _FTP_Close($hOpen)
