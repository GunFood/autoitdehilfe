#include <MsgBoxConstants.au3>
#include <SendMessage.au3>
#include <WinAPIDlg.au3>
#include <WinAPIMem.au3>
#include <WinAPIMisc.au3>
#include <WinAPIShellEx.au3>
#include <WinAPIShPath.au3>
#include <WinAPISysWin.au3>

Local Const $sInitDir = @ProgramFilesDir

Local $hBrowseProc = DllCallbackRegister('_BrowseProc', 'int', 'hwnd;uint;lparam;ptr')
Local $pBrowseProc = DllCallbackGetPtr($hBrowseProc)

Local $pText = _WinAPI_CreateString($sInitDir)
Local $sPath = _WinAPI_BrowseForFolderDlg(_WinAPI_PathStripToRoot($sInitDir), 'Einen Ordner von der Liste auswählen.', BitOR($BIF_RETURNONLYFSDIRS, $BIF_EDITBOX, $BIF_VALIDATE), $pBrowseProc, $pText)
_WinAPI_FreeMemory($pText)

If $sPath Then
	ConsoleWrite('--------------------------------------------------' & @CRLF)
	ConsoleWrite($sPath & @CRLF)
EndIf

DllCallbackFree($hBrowseProc)

Func _BrowseProc($hWnd, $iMsg, $wParam, $lParam)
	Local $sPath

	Switch $iMsg
		Case $BFFM_INITIALIZED
			_WinAPI_SetWindowText($hWnd, 'Mein Titel')
			_SendMessage($hWnd, $BFFM_SETSELECTIONW, 1, $lParam)
		Case $BFFM_SELCHANGED
			$sPath = _WinAPI_ShellGetPathFromIDList($wParam)
			If Not @error Then
				ConsoleWrite($sPath & @CRLF)
			EndIf
		Case $BFFM_VALIDATEFAILED
			MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), 'Fehler', _WinAPI_GetString($wParam) & ' ist ungültig.', 0, $hWnd)
			Return 1
	EndSwitch
	Return 0
EndFunc   ;==>_BrowseProc
