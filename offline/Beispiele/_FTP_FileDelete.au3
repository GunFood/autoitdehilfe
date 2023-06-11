#include <FTPEx.au3>
#include <MsgBoxConstants.au3>

_Example()

Func _Example()
	Local $sServer = '127.0.0.1' ; nicht existent
	Local $sUsername = 'Bert'
	Local $sPass = "Test"
	Local $sPath = '/ReadMe.txt'
	Local $hFile, $sText

	Local $hOpen = _FTP_Open('MyFTP Control')
	Local $hConn = _FTP_Connect($hOpen, $sServer, $sUsername, $sPass)

	If @error Then
		MsgBox($MB_SYSTEMMODAL, '_FTP_Connect', 'ERROR=' & @error)
	Else
		_FTP_FileDelete($hConn, $sPath)
		If @error Then
			MsgBox($MB_APPLMODAL, $sPath, 'konnte nicht gelöscht werden!')
		Else
			MsgBox($MB_APPLMODAL, $sPath, 'wurde gelöscht!')
		EndIf
	EndIf
	_FTP_Close($hConn)
	_FTP_Close($hOpen)
EndFunc   ;==>_Example

