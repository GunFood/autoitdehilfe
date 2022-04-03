#include <MsgBoxConstants.au3>
#include <WinAPIGdi.au3>
#include <WinAPISys.au3>

If Number(_WinAPI_GetVersion()) < 6.0 Then
	MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), 'Fehler', 'Windows Vista oder neuer wird benötigt.')
	Exit
EndIf

Local $aState[2] = ['Deaktiviert', 'Aktiviert']

ConsoleWrite('Aero ist: ' & $aState[_WinAPI_DwmIsCompositionEnabled()] & @CRLF)
