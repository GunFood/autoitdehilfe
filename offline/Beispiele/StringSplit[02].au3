#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

Example()

Func Example()
	Local $sText = "Diese\nZeile\nenthält\nC-style Trennungen." ; Definiert eine Variable mit Text.
	Local $aArray = StringSplit($sText, '\n', $STR_ENTIRESPLIT) ; Übergibt die Variable an StringSplit und verwendet das Trennzeichen "\n".
	; Es ist zu beachten, dass der flag Parameter auf $STR_ENTIRESPLIT (1) gesetzt ist. Sonst wird es bei jedem \ bzw n getrennt und nicht nur wenn beide Zeichen zusammen auftreten.
	#cs
		Das zurückgegebene Array wird folgende Werte enthalten:
		$aArray[1] = "Diese"
		$aArray[2] = "Zeile"
		...
		$aArray[4] = "C-style Trennungen."
	#ce

	For $i = 1 To $aArray[0] ; Durchläuft das Array welches von StringSplit zurückgegeben wurde. Es werden die individuellen Werte dargestellt.
		MsgBox($MB_SYSTEMMODAL, "", "$aArray[" & $i & "] - " & $aArray[$i])
	Next
EndFunc   ;==>Example
