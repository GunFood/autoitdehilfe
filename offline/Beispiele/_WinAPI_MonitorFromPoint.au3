#include <WinAPIGdi.au3>
#include <WinAPIMisc.au3>

Local $tPos = _WinAPI_GetMousePos()
DllStructSetData($tPos, 1, 12000)
Local $hMonitor = _WinAPI_MonitorFromPoint($tPos, 0)
ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $hMonitor = ' & $hMonitor & @CRLF & '>Fehlercode: ' & @error & '    Extended code: 0x' & Hex(@extended) & @CRLF) ;### Debug Console

Local $aData = _WinAPI_GetMonitorInfo($hMonitor)
If IsArray($aData) Then
	ConsoleWrite('Handle:      ' & $hMonitor & @CRLF)
	ConsoleWrite('Rechteck:   ' & DllStructGetData($aData[0], 1) & ', ' & DllStructGetData($aData[0], 2) & ', ' & DllStructGetData($aData[0], 3) & ', ' & DllStructGetData($aData[0], 4) & @CRLF)
	ConsoleWrite('Arbeitsbereich:   ' & DllStructGetData($aData[1], 1) & ', ' & DllStructGetData($aData[1], 2) & ', ' & DllStructGetData($aData[1], 3) & ', ' & DllStructGetData($aData[1], 4) & @CRLF)
	ConsoleWrite('Primär:     ' & $aData[2] & @CRLF)
	ConsoleWrite('Gerätename: ' & $aData[3] & @CRLF)
EndIf
