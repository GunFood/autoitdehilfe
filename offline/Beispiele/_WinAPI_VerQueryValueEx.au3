#include "Extras\HelpFileInternals.au3"

#include <Array.au3>
#include <WinAPILocale.au3>
#include <WinAPIRes.au3>

Local $sDll = _Extras_PathFull('Resources.dll')
Local $aData = _WinAPI_VerQueryValueEx($sDll, 'FileDescription|FileVersion|OriginalFilename', -1)

If Not @error Then
	For $i = 1 To $aData[0][0]
		$aData[$i][0] = _WinAPI_GetLocaleInfo($aData[$i][0], $LOCALE_SLANGUAGE)
	Next
EndIf

_ArrayDisplay($aData, '_WinAPI_VerQueryValueEx')
