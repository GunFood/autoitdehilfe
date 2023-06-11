Example()

Func Example()
	Local $iInt_Unsigned = 43951789
	Local $iInt_Negative = -43951789

	ConsoleWrite(@CRLF & "Numerische Formate" & @CRLF)

	PrintFormat($iInt_Unsigned, "%d", "Standard positiver Integer ohne Vorzeichen", 1) ; 43951789
	PrintFormat($iInt_Negative, "%d", "Standard negativer integer mit Vorzeichen", 1) ; -43951789
	PrintFormat($iInt_Unsigned, "%i", "Standard Integer", 1) ; 43951789
	PrintFormat($iInt_Unsigned, "%09i", "9 Ziffern mit führender Null", 1) ; 043951789
	PrintFormat($iInt_Unsigned, "%e", "wissenschaftliche Schreibweise") ; 4.395179e+007
	PrintFormat($iInt_Unsigned, "%u", "vorzeichenlose Integerschreibweise eines positiven Integerwerts", 1) ; 43951789
	PrintFormat($iInt_Negative, "%u", "vorzeichenlose Integerschreibweise eines negativen Integerwerts", 1) ; 4251015507
	PrintFormat($iInt_Unsigned, "%f", "standardmäßige Gleitpunktschreibweise") ; 43951789.000000
	PrintFormat($iInt_Unsigned, "%.2f", "Gleitpunktschreibweise mit 2 Stellen nach dem Dezimalpunkt", 1) ; 43951789.00
	PrintFormat($iInt_Unsigned, "%o", "Darstellung als Oktalzahl", 1) ; 247523255
	PrintFormat($iInt_Unsigned, "%s", "Darstellung als String", 1) ; 43951789
	PrintFormat($iInt_Unsigned, "%x", "Darstellung als Hexadezimalzahl mit Präfix in Kleinschreibung", 1) ; 29ea6ad
	PrintFormat($iInt_Unsigned, "%X", "Darstellung als Hexadezimalzahl ohne Präfix und in Großschreibung", 1) ; 29EA6AD
	PrintFormat($iInt_Unsigned, "%+d", "Darstellung eines positiven Integerwerts bei erzwungenem Vorzeichen", 1) ; +43951789
	PrintFormat($iInt_Negative, "%+d", "Darstellung eines negativen Integerwerts bei erzwungenem Vorzeichen", 1) ; -43951789

	Local $sString = "string"
	Local $sString_Long = "longstring"

	ConsoleWrite(@CRLF & "Stringformate - [ ] werden für den Beginn und das Ende des Strings verwendet" & @CRLF)

	PrintFormat($sString, "[%s]", "Standardstring", 1) ; [string]
	PrintFormat($sString, "[%10s]", "rechtsbündige Ausgabe von 10 Zeichen mit auffüllenden Leerzeichen") ; [    string]
	PrintFormat($sString, "[%-10s]", "linksbündige Ausgabe von 10 Zeichen mit auffüllenden Leerzeichen") ; [string    ]
	PrintFormat($sString_Long, "[%10.8s]", "rechtsbündige Ausrichtung von 10 Zeichen, aber nur 8 Zeichen der Variablen werden verwendet") ; [  longer s]
	PrintFormat($sString_Long, "[%-10.8s]", "linksbündige Ausrichtung von 10 Zeichen, aber nur 8 Zeichen der Variablen werden verwendet") ; [longer s  ]
	PrintFormat($sString, "[%010s]", "10 Zeichen mit führender Null") ; [0000string]

	ConsoleWrite(@CRLF & "Datenformat - jedes % verwendet einen neuen Parameter" & @CRLF)
	ConsoleWrite('"%02i\%02i\%04i" 0n (1, 9, 2013) => ' & StringFormat("%02i\%02i\%04i", 1, 9, 2013) & @CRLF)

	ConsoleWrite(@CRLF & "Nur ein zu formatierender String  ohne Variablen" & @CRLF)
	ConsoleWrite('"Etwas \tBeispieltext\n" => ' & StringFormat('Etwas \tBeispieltext\n'))
EndFunc   ;==>Example

Func PrintFormat($vVar, $sFormat, $sExplan, $iTab = 0)
	ConsoleWrite('"' & $sFormat & '" on ' & $vVar & @TAB & ' => ' & StringFormat($sFormat, $vVar))
	If $iTab Then ConsoleWrite(@TAB)
	ConsoleWrite(@TAB & " ; " & $sExplan & @CRLF)
EndFunc   ;==>PrintFormat
