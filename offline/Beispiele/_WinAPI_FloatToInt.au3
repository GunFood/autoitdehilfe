#include <MsgBoxConstants.au3>
#include <WinAPIConv.au3>

Example()

Func Example()
	Local $fFloat, $sText, $iInt
	$fFloat = 10.55
	$iInt = _WinAPI_FloatToInt($fFloat)
	$sText = "Die Gleitkommazahl " & $fFloat & " ergibt konvertiert in einen Integerwert: " & $iInt & " (Hex = " & Hex($iInt) & ")"
	MsgBox($MB_SYSTEMMODAL, "_WinAPI_FloatToInt Beispielergebnisse", $sText)
EndFunc   ;==>Example
