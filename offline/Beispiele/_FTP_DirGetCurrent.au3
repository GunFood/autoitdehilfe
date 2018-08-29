#include <FTPEx.au3>
#include <MsgBoxConstants.au3>

_Example()

Func _Example()
	Local $sServer = 'ftp.csx.cam.ac.uk' ; UNIVERSITY OF CAMBRIDGE ANONYMOUS FTP SERVER
	Local $sUsername = ''
	Local $sPass = ''
	Local $Err, $sFTP_Message
	Local $sDir

	Local $hOpen = _FTP_Open('MyFTP Control')
	Local $hConn = _FTP_Connect($hOpen, $sServer, $sUsername, $sPass)
	If @error Then
		MsgBox($MB_SYSTEMMODAL, '_FTP_Connect', 'ERROR=' & @error)
	Else
		$sDir = _FTP_DirGetCurrent($hConn)
		MsgBox($MB_SYSTEMMODAL, 'Aktueler Pfad', $sDir)
		_FTP_DirSetCurrent($hConn, '/pub') ;zu /pub wechseln
		$sDir = _FTP_DirGetCurrent($hConn)
		MsgBox($MB_SYSTEMMODAL, 'Neuer Aktueler Pfad', $sDir)
		_FTP_DirSetCurrent($hConn, '..') ;eine Verzeichnisebene zurück
		$sDir = _FTP_DirGetCurrent($hConn)
		MsgBox($MB_SYSTEMMODAL, 'Aktueler Pfad', $sDir)
	EndIf
	_FTP_Close($hConn)
	_FTP_Close($hOpen)
EndFunc   ;==>_Example
