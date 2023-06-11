#include <Array.au3>
#include <WinAPISys.au3>
#include <WinAPIsysinfoConstants.au3>
#include <WindowsConstants.au3>

Local $aArray = GetWorkArea()
_ArrayDisplay($aArray, _WinAPI_GetSystemMetrics($SM_CXVIRTUALSCREEN) & ', ' & _WinAPI_GetSystemMetrics($SM_CYVIRTUALSCREEN))

; Ermittelt den sichtbaren Arbeitsbereich des Desktops. Dies enthält nicht den Bereich der durch die Taskleiste überdeckt wird..
Func GetWorkArea()
	Local $tWorkArea = DllStructCreate($tagRECT)
	_WinAPI_SystemParametersInfo($SPI_GETWORKAREA, 0, $tWorkArea)
	Local $aReturn[4] = [DllStructGetData($tWorkArea, 'Left'), DllStructGetData($tWorkArea, 'Top'), _
			DllStructGetData($tWorkArea, 'Right') - DllStructGetData($tWorkArea, 'Left'), DllStructGetData($tWorkArea, 'Bottom') - DllStructGetData($tWorkArea, 'Top')]
	Return $aReturn
EndFunc   ;==>GetWorkArea
