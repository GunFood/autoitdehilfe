#include <WinAPIReg.au3>
#include <WinAPIShPath.au3>

Local $sData = _WinAPI_AssocQueryString('.txt', $ASSOCSTR_DEFAULTICON)
Local $aIcon = _WinAPI_PathParseIconLocation($sData)

If IsArray($aIcon) Then
	ConsoleWrite('Standard-Icon: ' & $sData & @CRLF)
	ConsoleWrite('Icon: ' & $aIcon[0] & @CRLF)
	ConsoleWrite('Index: ' & $aIcon[1] & @CRLF)
EndIf
