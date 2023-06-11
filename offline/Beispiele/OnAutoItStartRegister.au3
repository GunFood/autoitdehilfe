#include <MsgBoxConstants.au3>

; Registriert Example() und SomeFunc(), damit diese aufgerufen werden wenn AutoIt startet.

#OnAutoItStartRegister "Example"
#OnAutoItStartRegister "SomeFunc"

Sleep(1000)

Func Example()
	MsgBox($MB_SYSTEMMODAL, "", "Die Funktion 'Example' wird zuerst aufgerufen")
EndFunc   ;==>MyTestFunc

Func SomeFunc()
	MsgBox($MB_SYSTEMMODAL, "", "Die Funktion 'SomeFunc' wird danach aufgerufen")
EndFunc   ;==>MyTestFunc2
