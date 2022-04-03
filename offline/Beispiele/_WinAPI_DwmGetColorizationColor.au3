#include <MsgBoxConstants.au3>
#include <WinAPIGdi.au3>

If Not _WinAPI_DwmIsCompositionEnabled() Then
	MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), 'Fehler', 'Windows Vista oder neuer mit aktiviertem Aero Themea wird benötigt.')
	Exit
EndIf

Local $iColor = _WinAPI_DwmGetColorizationColor()
Local $iBlend = @extended

ConsoleWrite('Farbe für die Glas-Zusammensetzung: 0x' & Hex($iColor) & @CRLF)
ConsoleWrite('Transparenz: ' & (Not $iBlend) & @CRLF)
