#include <MsgBoxConstants.au3>
#include <WinAPIShellEx.au3>

Local $sIcon = RegRead('HKCR\AutoIt3Script\DefaultIcon', '')

If Not @error Then
	RegWrite('HKCR\AutoIt3Script\DefaultIcon', '', 'REG_SZ', @SystemDir & '\shell32.dll,-152')
	_WinAPI_ShellChangeNotify($SHCNE_ASSOCCHANGED, $SHCNF_FLUSH)
	MsgBox($MB_SYSTEMMODAL, '', 'Das Icon für .au3 Dateien wurde geändert. Um dies wieder zurückzustellen OK drücken.')
	RegWrite('HKCR\AutoIt3Script\DefaultIcon', '', 'REG_SZ', $sIcon)
	_WinAPI_ShellChangeNotify($SHCNE_ASSOCCHANGED, $SHCNF_FLUSH)
EndIf
