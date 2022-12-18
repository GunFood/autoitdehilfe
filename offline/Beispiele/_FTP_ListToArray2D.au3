#include <FTPEx.au3>

;~ Local $sServer = 'ftp.cs.brown.edu' ; Brown Computer Science
Local $sServer = 'speedtest.tele2.net' ; Tele2 Speedtest Service
Local $sUsername = ''
Local $sPass = ''

Local $hOpen = _FTP_Open('MyFTP Control')
Local $hConn = _FTP_Connect($hOpen, $sServer, $sUsername, $sPass)

Local $aFile = _FTP_ListToArray2D($hConn, 0)
ConsoleWrite('$FileName = ' & $aFile[0][0] & '  -> Fehlercode: ' & @error & @CRLF)
ConsoleWrite('$FileName = ' & $aFile[1][0] & ' Größe = ' & $aFile[1][1] & @error & @CRLF)
ConsoleWrite('$FileName = ' & $aFile[2][0] & ' Größe = ' & $aFile[2][1] & @CRLF)

Local $iFtpc = _FTP_Close($hConn)
Local $iFtpo = _FTP_Close($hOpen)
