#include <MsgBoxConstants.au3>

; Ruft die Example-Funktion auf um die statische Variable in dessen lokalen Gültigkeitsbereich (Scope) zu initialisieren.
Example()

; Ruft die Example-Funktion ein zweites Mal auf um zu zeigen, dass die Variable den Inhalt behalten hat, den wir ihr zuletzt zugewiesen haben.
Example()

Func Example()
	Local Static $sString = "Dies ist eine Textzeile welche deklariert wird mittels einer statischen Variable innerhalb eines lokalen Gültigkeitsbereich." & @CRLF & @CRLF & _
			"Die Variable $sString wird nur dieser Funktion sichtbar sein bis das Script sich beendet."


	MsgBox($MB_SYSTEMMODAL, "", $sString)
	$sString = "Wenn man nur den lokalen Gültigkeitsbereich für diesen String verwenden würde, so wäre dieser String nicht sichtbar wenn wir die Funktion mehrfach aufrufen." & @CRLF & @CRLF & _
			"Da wir aber das Static Schlüsselwort verwenden wird die Variable $sString ihren zuletzt zugewiesenen Wert behalten."
EndFunc   ;==>Example
