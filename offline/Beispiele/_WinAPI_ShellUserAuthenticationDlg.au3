#include "Extras\HelpFileInternals.au3"

#include <Crypt.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIDlg.au3>
#include <WinAPIRes.au3>

Local $sBmp = _Extras_PathFull('Authentication.bmp')
Local $hBitmap = _WinAPI_LoadImage(0, $sBmp, $IMAGE_BITMAP, 0, 0, $LR_LOADFROMFILE)
Local $aData[3] = ['', '', 0]

Local $sUser = 'AutoIt'
Local $sPassword = '123'

Local $sPasswordToCryptPassword = '1234'
Local $dPaswordEncrypted = StringEncrypt($sPassword, $sPasswordToCryptPassword)

While 1
	$aData = _WinAPI_ShellUserAuthenticationDlg('Authentication', 'To continue, type a login and password, and then click OK.', $aData[0], $aData[1], 'MyScript', BitOR($CREDUI_FLAGS_ALWAYS_SHOW_UI, $CREDUI_FLAGS_EXPECT_CONFIRMATION, $CREDUI_FLAGS_GENERIC_CREDENTIALS, $CREDUI_FLAGS_SHOW_SAVE_CHECK_BOX), 0, $aData[2], $hBitmap)
	If @error Then Exit

	If StringCompare($aData[0], 'AutoIt') Or StringCompare($aData[1], StringDecrypt($dPaswordEncrypted, $sPasswordToCryptPassword)) Then
		If $aData[2] Then
			_WinAPI_ConfirmCredentials('MyScript', False)
		EndIf
		MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), 'Error', 'You have typed an incorrect login or password, it should be "' & $sUser & '" and "' & $sPassword & '".')
	Else
		If $aData[2] Then
			_WinAPI_ConfirmCredentials('MyScript', True)
		EndIf
		ExitLoop
	EndIf
WEnd

Func StringEncrypt($sData, $sPassword)
	_Crypt_Startup() ; Start the Crypt library.
	Local $sReturn = _Crypt_EncryptData($sData, $sPassword, $CALG_RC4)
	_Crypt_Shutdown() ; Shutdown the Crypt library.
	Return $sReturn
EndFunc   ;==>StringEncrypt

Func StringDecrypt($sData, $dPassword)
	_Crypt_Startup() ; Start the Crypt library.
	Local $sReturn = BinaryToString(_Crypt_DecryptData($sData, $dPassword, $CALG_RC4))
	_Crypt_Shutdown() ; Shutdown the Crypt library.
	Return $sReturn
EndFunc   ;==>StringDecrypt
