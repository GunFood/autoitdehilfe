#include <APIGdiConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIGdi.au3>

If Not _WinAPI_DwmIsCompositionEnabled() Then
	MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), 'Fehler', 'Windows Vista oder neuer mit aktiviertem Aero Themea wird benötigt.')
	Exit
EndIf

Run(@SystemDir & '\calc.exe')
Local $hWnd = WinWaitActive("[CLASS:ApplicationFrameWindow]", '');, 3)
If Not $hWnd Then
	Exit
EndIf

Local $aPos = _WinAPI_GetPosFromRect(_WinAPI_DwmGetWindowAttribute($hWnd, $DWMWA_EXTENDED_FRAME_BOUNDS))

ConsoleWrite('Links:   ' & $aPos[0] & @CRLF)
ConsoleWrite('Oben:    ' & $aPos[1] & @CRLF)
ConsoleWrite('Breite:  ' & $aPos[2] & @CRLF)
ConsoleWrite('Höge:    ' & $aPos[3] & @CRLF)
