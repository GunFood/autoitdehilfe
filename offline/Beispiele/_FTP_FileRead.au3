#include <FTPEx.au3>
#include <MsgBoxConstants.au3>

_Example()

Func _Example()
    Local $sServer = 'ftp.csx.cam.ac.uk' ; UNIVERSITY OF CAMBRIDGE ANONYMOUS FTP SERVER
    Local $sUsername = ''
    Local $sPass = ''
	Local $sPath ='/pub/README'
	Local $hFile, $sText

    Local $hOpen = _FTP_Open('MyFTP Control')
    Local $hConn = _FTP_Connect($hOpen, $sServer, $sUsername, $sPass)

    If @error Then
        MsgBox($MB_SYSTEMMODAL, '_FTP_Connect', 'ERROR=' & @error)
    Else
		$hFile=_FTP_FileOpen($hConn,$sPath)
		$sText=BinaryToString(_FTP_FileRead($hFile,9999))  ;aus Datei lesen und in Stringformat wandeln
		_FTP_FileClose($hFile)
		MsgBox($MB_APPLMODAL, 'README: ',$sText)
     EndIf
    _FTP_Close($hConn)
    _FTP_Close($hOpen)
EndFunc   ;==>_Example
