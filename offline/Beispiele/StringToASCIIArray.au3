#include <MsgBoxConstants.au3>
#include <Array.au3> ; Required for _ArrayDisplay() only.

Example()

Func Example()
	; Konvertiert den String in ein Array.
	Local $aArray = StringToASCIIArray("This is a sentence with whitespace.")

	; Das Array anzeigen, um zu verdeutlichen, dass es die ASCII-Werte jedes Zeichens enthält.
	_ArrayDisplay($aArray)

	; Jetzt das Array in einen String umwandeln.
	Local $sString = StringFromASCIIArray($aArray)

	; Anzeige des Strings, um die Übereinstimmung mit der Originaleingabe zu belegen. Der String wurde ursprünglich in ein Array umgewandelt.
	MsgBox($MB_SYSTEMMODAL, "", $sString)
EndFunc   ;==>Example
