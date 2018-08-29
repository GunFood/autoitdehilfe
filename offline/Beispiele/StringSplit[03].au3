#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

Example()

Func Example()
	Local $sText = "Diese\nZeile\nenthält\nC-style Trennungen." ; Definiert eine Variable mit Text.

	; Übergibt die Variable an StringSplit und verwendet das Trennzeichen "\n".
	; Es ist zu beachten, dass der flag Parameter auf $STR_ENTIRESPLIT (1) gesetzt ist. Sonst wird es bei jedem \ bzw n getrennt und nicht nur wenn beide Zeichen zusammen auftreten.
	MsgBox($MB_SYSTEMMODAL, "", StringSplit($sText, '\n', $STR_ENTIRESPLIT)[2]) ; Direkter Zugriff auf den Arrayindex durch die Verwendung des Arrayzugriffs auf den Ausdruck.
	#cs
		Ein internes temporäres Array wird verwendet um einen String zurückzugeben, der die folgenden Werte enthalten sollte.:
		$aArray[1] = "Diese"
		$aArray[2] = "Zeile"
		...
		$aArray[4] = "C-style Trennungen."
	#ce
EndFunc   ;==>Example
