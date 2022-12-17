#include <WinAPIGdi.au3>
#include <WinAPIMisc.au3>

; Um zu überprüfen, wie dies auf einem "Dual Monitor" funktioniert, die Maus auf den zweiten Monitor bewegen und dieses Skript erneut ausführen
_Example()

Func _Example()
	; Mauskoordinaten ermitteln
	Local $tPos = _WinAPI_GetMousePos()
	ConsoleWrite('MouseX = ' & DllStructGetData($tPos, 1) & @CRLF)
	ConsoleWrite('MouseY = ' & DllStructGetData($tPos, 2) & @CRLF)

	; $hMonitor aus den zuvor definierten Mauskoordinaten ermitteln
	Local $hMonitor = _WinAPI_MonitorFromPoint($tPos)
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $hMonitor = ' & $hMonitor & @CRLF & '>Fehlercode: ' & @error & '    Extended code: 0x' & Hex(@extended) & @CRLF) ;### Debug Console

	; die Monitor $aData für die zuvor definierten Koordinaten abrufen
	Local $aData = _WinAPI_GetMonitorInfo($hMonitor)
	If Not @error Then
		ConsoleWrite('Handle:      ' & $hMonitor & @CRLF)
		ConsoleWrite('Rechteck:   ' & DllStructGetData($aData[0], 1) & ', ' & DllStructGetData($aData[0], 2) & ', ' & DllStructGetData($aData[0], 3) & ', ' & DllStructGetData($aData[0], 4) & @CRLF)
		ConsoleWrite('Arbeitsbereich:   ' & DllStructGetData($aData[1], 1) & ', ' & DllStructGetData($aData[1], 2) & ', ' & DllStructGetData($aData[1], 3) & ', ' & DllStructGetData($aData[1], 4) & @CRLF)
		ConsoleWrite('Primär:     ' & $aData[2] & @CRLF)
		ConsoleWrite('Gerätename: ' & $aData[3] & @CRLF)
	EndIf
EndFunc   ;==>_Example