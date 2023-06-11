#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Ermittelt die Dateiversion der AutoIt Startdatei.
	Local $sFileVersion = FileGetVersion(@AutoItExe)

	; Zeigt die Dateiversion. Diese sollte gleich wie @AutoItVersion sein.
	MsgBox($MB_SYSTEMMODAL, "", $sFileVersion)
EndFunc   ;==>Example
