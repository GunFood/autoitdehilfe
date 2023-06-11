#include <MsgBoxConstants.au3>

MsgBox($MB_SYSTEMMODAL, "", "Ist der String 42 eine hexadezimale Ziffer: " & StringIsXDigit("42") & @CRLF & _ ; Gibt 1 zurück, da der String nur hexadizmale (0-9, A-F) Zeichen enthält.
		"Ist der String 00  eine hexadezimale Ziffer: " & StringIsXDigit("00") & @CRLF & _ ; Gibt 1 zurück, da der String nur hexadizmale (0-9, A-F) Zeichen enthält.
		"Ist der String 1.0  eine hexadezimale Ziffer: " & StringIsXDigit("1.0") & @CRLF & _ ; Gibt 0 zurück aufgrund dem Dezimalpunkt.
		"Ist die Zahl 1.0  eine hexadezimale Ziffer: " & StringIsXDigit(1.0) & @CRLF & _ ; Gibt 1 zurück, aufgrund der Zahl in String Umwandlung.
		"Ist der String 'A string'  eine hexadezimale Ziffer: " & StringIsXDigit("A string.") & @CRLF) ; Gibt 0 zurück, da der String Leerzeichen enthält.
