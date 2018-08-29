#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Ermittelt die Dateigröße (in bytes) der AutoIt Startdatei.
	Local $iFileSize = FileGetSize(@AutoItExe)

	; Zeigt die Dateigröße und konvertiert diese in eine lesbare Form.
	MsgBox($MB_SYSTEMMODAL, "", ByteSuffix($iFileSize))
EndFunc   ;==>Example

Func ByteSuffix($iBytes)
	Local $iIndex = 0, $aArray = [' bytes', ' KB', ' MB', ' GB', ' TB', ' PB', ' EB', ' ZB', ' YB']
	While $iBytes > 1023
		$iIndex += 1
		$iBytes /= 1024
	WEnd
	Return Round($iBytes) & $aArray[$iIndex]
EndFunc   ;==>ByteSuffix
