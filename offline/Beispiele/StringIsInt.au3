#include <MsgBoxConstants.au3>

MsgBox($MB_SYSTEMMODAL, "", "Ist der String +42 ein Integer: " & StringIsInt("+42") & @CRLF & _ ; Gibt 1 zurück, da am Anfang des Strings ein + steht.
		"Ist der String -00 ein Integer: " & StringIsInt("-00") & @CRLF & _ ; Gibt 1 zurück, da am Anfang des Strings ein - steht.
		"Ist der String 1.0 ein Integer: " & StringIsInt("1.0") & @CRLF & _ ; Gibt 0 zurück, wegen des Dezimalpunkts.
		"Ist die Zahl 1.0 ein Integer: " & StringIsInt(1.0) & @CRLF & _ ; Gibt 1 zurück, aufgrund der Anzahl von Stringkonvertierungen.
		"Ist der String 1+2 ein Integer: " & StringIsInt("1+2") & @CRLF) ; Gibt 0 zurück, da das + nicht am Anfang des Strings steht.
