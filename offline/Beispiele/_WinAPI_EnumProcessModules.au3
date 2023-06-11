#include <Array.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIProc.au3>
#include <WinAPISys.au3>

If (Number(_WinAPI_GetVersion()) < 6.0) And (@AutoItX64) Then
	MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), 'Fehler', 'Dieses Beispiel funktioniert bei einem 64-bit System nur in Windows Vista oder neuer.')
	Exit
EndIf

Local $aData = _WinAPI_EnumProcessModules()

_ArrayDisplay($aData, '_WinAPI_EnumProcessModules')
