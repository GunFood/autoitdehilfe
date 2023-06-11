#include <MsgBoxConstants.au3>

MsgBox($MB_SYSTEMMODAL, "", "Ist der String 42 eine Ziffer: " & StringIsDigit("42") & @CRLF & _ ; Gibt 1 zurück, da der String nut Ziffern (0-9) enthält.
		"Ist der String 00 eine Ziffer: " & StringIsDigit("00") & @CRLF & _ ; Gibt 1 zurück, da der String nut Ziffern (0-9) enthält.
		"Ist der String 1.0 eine Ziffer: " & StringIsDigit("1.0") & @CRLF & _ ; Gibt 0 zurück, aufgrund des Dezimalpunktes.
		"Ist die Zahl 1.0 eine Ziffer: " & StringIsDigit(1.0) & @CRLF & _ ; Gibt 1 zurück, aufgrund der Zahl in String Umwandlung.
		"Ist der String 1+2 eine Ziffer: " & StringIsDigit("1+2") & @CRLF) ; Gibt 0 zurückm das + (plus) Zeichen vorhanden ist.
