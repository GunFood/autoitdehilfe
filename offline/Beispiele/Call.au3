#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Dies ruft eine Funktion auf, die keine Argumente akzeptiert.
	Call("Test1")

	; Dies ruft eine Funktion auf, die ein Argument akzeptiert, und übergibt ein Argument an diese.
	Call("Test2", "Nachricht von Call()!")

	; Dies demonstriert die Benutzung des 'special array' Arguments.
	Local $aArgs[4]
	$aArgs[0] = "CallArgArray" ; Diese Zuweisung ist erforderlich, anderenfalls wird Call() das Array nicht als Argumentinhalt erkennen
	$aArgs[1] = "Dies ist ein String" ; Parameter Eins ist ein String
	$aArgs[2] = 47 ; Parameter zwei ist eine Ganzzahl (Integer)
	Local $array[2]
	$array[0] = "Array Element 0"
	$array[1] = "Array Element 1"
	$aArgs[3] = $array ; Parameter drei ist ein Array

	; Wir haben das 'special array' erstellt, rufen wir nun die Funktion auf
	Call("Test3", $aArgs)

	; Testaufruf einer Funktion welche nicht existiert.
	; Überprüfung von @error und @extended auf die dokumentierten Fehlerwerte.
	Local Const $sFunction = "Existiert Nicht"
	Call($sFunction)
	If @error = 0xDEAD And @extended = 0xBEEF Then MsgBox($MB_SYSTEMMODAL, "", "Funktion existiert nicht.")
EndFunc   ;==>Example

Func Test1()
	MsgBox($MB_SYSTEMMODAL, "", "Hallo")
EndFunc   ;==>Test1

Func Test2($sMsg)
	MsgBox($MB_SYSTEMMODAL, "", $sMsg)
EndFunc   ;==>Test2

Func Test3($sString, $nNumber, $aArray)
	MsgBox($MB_SYSTEMMODAL, "", "Der String lautet: " & @CRLF & $sString)
	MsgBox($MB_SYSTEMMODAL, "", "Die Zahl lautet: " & @CRLF & $nNumber)
	For $i = 0 To UBound($aArray) - 1
		MsgBox($MB_SYSTEMMODAL, "", "Array[" & $i & "] beinhaltet:" & @CRLF & $aArray[$i])
	Next
EndFunc   ;==>Test3
