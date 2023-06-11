#include <Date.au3>
#include <WinAPILocale.au3>
#include <WinAPIProc.au3>

Global $aFT, $tFT, $tST, $ID = ProcessExists('SciTE.exe')

If $ID Then
	$aFT = _WinAPI_GetProcessTimes($ID)
	$tFT = _Date_Time_FileTimeToLocalFileTime(DllStructGetPtr($aFT[0]))
	$tST = _Date_Time_FileTimeToSystemTime(DllStructGetPtr($tFT))
	ConsoleWrite('SciTE wurde um ' & _WinAPI_GetTimeFormat(0, $tST) & " gestartet"& @CRLF)
EndIf
