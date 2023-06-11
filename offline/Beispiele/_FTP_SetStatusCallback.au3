#include <Debug.au3>
#include <FTPEx.au3>
#include <WinAPIHOBj.au3>
#include <WinAPIMem.au3>

_DebugSetup(StringTrimRight(@ScriptName, StringLen(".exe")) & ' example', True)

;~ Local $sServer = 'ftp.cs.brown.edu' ; Brown Computer Science
Local $sServer = 'speedtest.tele2.net' ; Tele2 Speedtest Service
Local $sUsername = ''
Local $sPass = ''

Local $hOpen = _FTP_Open('MyFTP Control')
Local $pCallback = _FTP_SetStatusCallback($hOpen, 'FTPStatusCallbackHandler')

Local $hConn = _FTP_Connect($hOpen, $sServer, $sUsername, $sPass, 0, $INTERNET_DEFAULT_FTP_PORT, $INTERNET_SERVICE_FTP, 0, $pCallback)

Local $iFtpc = _FTP_Close($hConn)
Local $iFtpo = _FTP_Close($hOpen)

Func FTPStatusCallbackHandler($hInternet, $iContext, $iInternetStatus, $pStatusInformation, $iStatusInformationLength)
	#forceref $hInternet, $iContext
	If $iInternetStatus = $INTERNET_STATUS_REQUEST_SENT Or $iInternetStatus = $INTERNET_STATUS_RESPONSE_RECEIVED Then
		Local $iBytesRead
		Local $tStatus = DllStructCreate('dword')
		_WinAPI_ReadProcessMemory(_WinAPI_GetCurrentProcess(), $pStatusInformation, DllStructGetPtr($tStatus), $iStatusInformationLength, $iBytesRead)
		_DebugOut(_FTP_DecodeInternetStatus($iInternetStatus) & ' | Größe = ' & DllStructGetData($tStatus, 1) & ' Bytes    Bytes gelesen = ' & $iBytesRead)
	Else
		_DebugOut(_FTP_DecodeInternetStatus($iInternetStatus))
	EndIf
EndFunc   ;==>FTPStatusCallbackHandler
