#include <APIThemeConstants.au3>
#include <WinAPITheme.au3>

Local $aData = _WinAPI_GetCurrentThemeName()
If IsArray($aData) Then
	ConsoleWrite('Datei:    ' & $aData[0] & @CRLF)
	ConsoleWrite('Farbe:   ' & $aData[1] & @CRLF)
	ConsoleWrite('Größe:    ' & $aData[2] & @CRLF)
	ConsoleWrite('Name:    ' & _WinAPI_GetThemeDocumentationProperty($aData[0], $SZ_THDOCPROP_CANONICALNAME) & @CRLF)
	ConsoleWrite('Anzeige: ' & _WinAPI_GetThemeDocumentationProperty($aData[0], $SZ_THDOCPROP_DISPLAYNAME) & @CRLF)
	ConsoleWrite('Tooltip: ' & _WinAPI_GetThemeDocumentationProperty($aData[0], $SZ_THDOCPROP_TOOLTIP) & @CRLF)
	ConsoleWrite('Autor:  ' & _WinAPI_GetThemeDocumentationProperty($aData[0], $SZ_THDOCPROP_AUTHOR) & @CRLF)
EndIf
