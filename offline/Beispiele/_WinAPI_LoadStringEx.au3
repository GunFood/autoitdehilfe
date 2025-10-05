#include "Extras\HelpFileInternals.au3"

#include <WinAPILocale.au3>
#include <WinAPIRes.au3>

Local $sDll = _Extras_PathFull('Resources.dll')
Local $hInstance = _WinAPI_LoadLibraryEx($sDll, $LOAD_LIBRARY_AS_DATAFILE)

; Warum ist der Ressourcenname für den String mit ID = 6000 376? 6000 / 16 + 1 = 376
Local $aData = _WinAPI_EnumResourceLanguages($hInstance, $RT_STRING, 376)
If IsArray($aData) Then
	For $i = 1 To $aData[0]
		ConsoleWrite(StringFormat('%-10s - %s', _WinAPI_GetLocaleInfo($aData[$i], $LOCALE_SENGLANGUAGE), _WinAPI_LoadStringEx($hInstance, 6000, $aData[$i])) & @CRLF)
	Next
EndIf
