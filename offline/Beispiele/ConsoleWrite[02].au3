; == Beispiel 2 für das schreiben in den SciTE Ausgabebereich

ConsoleWrite('! = Rot' & @CRLF) ; ! = rote Textfarbe
ConsoleWrite('> = Blau' & @CRLF) ; > = blaue Textfarbe
ConsoleWrite('- = Orange' & @CRLF) ; - = orange Textfarbe
ConsoleWrite('+ = Grün' & @CRLF) ; + = grüne Textfarbe
ConsoleWrite('(5) : = Rot (springt bei Doppelklick in Zeile 5)' & @CRLF) ; '(5) :' rote Textfarbe springt bei Doppelklick in die Zeile
ConsoleWrite('Beginnt es mit einem String oder Integer, dann ' & @TAB & '6' & ' = Pink (springt bei Doppelklick in Zeile 6)' & @CRLF)
; pinke Textfarbe, ein Zeichen (keine Leerzeichen)und dann @TAB & 'Zeilennummer'

; Beispiel 1
ConsoleWrite('(' & @ScriptLineNumber & ') : = Rot (springt bei Doppelklick in Zeile ' & @ScriptLineNumber & ')' & @CRLF)

; Leert den Ausgabeberecih von SciTE nach 5000 ms
Sleep(5000)
ControlSend("[CLASS:SciTEWindow]", "", "Scintilla2", "+{F5}")
