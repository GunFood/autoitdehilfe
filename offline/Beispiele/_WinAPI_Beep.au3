#include <MsgBoxConstants.au3>
#include <WinAPIError.au3>

Example()

Func Example()
	Local $iFreqStart = 100
	Local $iFreqEnd = 250

	MsgBox($MB_SYSTEMMODAL, "_WinAPI_Beep Beispiel 1", "Ansteigende Tonhöhe")

	For $iFreq = $iFreqStart To $iFreqEnd
		_WinAPI_Beep($iFreq, 100)
		ToolTip("Frequenz = " & $iFreq)
	Next

	MsgBox($MB_SYSTEMMODAL, "_WinAPI_Beep Beispiel 2", "Abfallende Tonhöhe")

	For $iFreq = $iFreqEnd To $iFreqStart Step -1
		_WinAPI_Beep($iFreq, 100)
		ToolTip("Frequenz = " & $iFreq)
	Next
EndFunc   ;==>Example
