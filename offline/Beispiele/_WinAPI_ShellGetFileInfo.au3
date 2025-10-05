#include <APIShellExConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WinAPIDlg.au3>
#include <WinAPIIcons.au3>
#include <WinAPIShellEx.au3>

Example()

Func Example()
	GUICreate("", 128, 128)
	Local $idIcon = GUICtrlCreateIcon("", 0, 48, 48, 32, 32)
	_Icon_Set($idIcon, @ScriptFullPath)
	GUISetState(@SW_SHOW)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func _Icon_Clear($iControlID)
	If $iControlID = -1 Then $iControlID = _WinAPI_GetDlgCtrlID(GUICtrlGetHandle($iControlID))
	Return GUICtrlSendMsg($iControlID, $STM_SETIMAGE, $IMAGE_ICON, 0)
EndFunc   ;==>_Icon_Clear

Func _Icon_Set($iControlID, $sFilePath)
	If $iControlID = -1 Then $iControlID = _WinAPI_GetDlgCtrlID(GUICtrlGetHandle($iControlID))
	Local $tInfo = DllStructCreate($tagSHFILEINFO)
	_WinAPI_ShellGetFileInfo($sFilePath, BitOR($SHGFI_ICON, $SHGFI_LARGEICON), 0, $tInfo)
	Local $hIcon = DllStructGetData($tInfo, 'hIcon')
	Return _WinAPI_DestroyIcon(GUICtrlSendMsg($iControlID, $STM_SETIMAGE, $IMAGE_ICON, $hIcon))
EndFunc   ;==>_Icon_Set
