#include <MsgBoxConstants.au3>

MsgBox($MB_SYSTEMMODAL, "", "Ist der String 1.5 eine Gleitkommazahl: " & StringIsFloat("1.5") & @CRLF & _ ; Gibt 1 zurück, wegen des Dezimalpunkts.
		"Ist der String 7. eine Gleitkommazahl: " & StringIsFloat("7.") & @CRLF & _ ; Gibt 1 zurück, wegen des Dezimalpunkts.
		"Ist der String 3/4 eine Gleitkommazahl: " & StringIsFloat("3/4") & @CRLF & _ ; Gibt 0 zurück, da der String 3/4 keine Gleitkommazahl ist.
		"Ist die Zahl 1.0 eine Gleitkommazahl: " & StringIsFloat(1.0) & @CRLF & _ ; Gibt 1 zurück, aufgrund der Anzahl von Stringkonvertierungen und wegen des Dezimalpunktes
		"Ist der String 2 eine Gleitkommazahl: " & StringIsFloat("2") & @CRLF) ; Gibt 0 zurück, da 2 ein Integer ist.
