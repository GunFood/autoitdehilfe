#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aDays = StringSplit("Mo,Di,Mi,Do,Fr,Sa,So", ",") ; Trennt den String mit den Tagen durch das Trennzeichen ",".
	#cs
		Das Array gibt folgende Werte zurück:
		$aDays[1] = "Mo"
		$aDays[2] = "Di"
		$aDays[3] = "Mi"
		...
		$aDays[7] = "So"
	#ce

	For $i = 1 To $aDays[0] ; Durchläuft das Array, welches durch StringSplit zurückgegeben wurde und stellt die Werte dar.
		MsgBox($MB_SYSTEMMODAL, "", "$aDays[" & $i & "] - " & $aDays[$i])
	Next
EndFunc   ;==>Example
