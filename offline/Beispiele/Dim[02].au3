#AutoIt3Wrapper_Au3Check_Parameters=-q -d -w- 3 -w- 6 ; var bereits deklariert=off, warnen bei Verwendung von Dim=off

#include <MsgBoxConstants.au3>

Dim $vVariableThatIsGlobal = "Dies ist eine Variable mit dem ""Programm Anwendungsbereich"" auch bekannt als Global."

MsgBox($MB_SYSTEMMODAL, "", "Ein Beispiel dafür, warum Dim mehr Probleme verursachen als lösen kann.")

Example()

Func Example()
	; Das sieht für mich in Ordnung aus, da es den folgenden Text anzeigt: Dies ist eine Variable mit dem "Programm Anwendungsbereich" auch bekannt als Global.
	MsgBox($MB_SYSTEMMODAL, "", $vVariableThatIsGlobal)

	; Ruft eine Zufallsfunktion auf.
	Local $vReturn = SomeFunc()

	; Die globale Variable ($vVariableThatIsGlobal) hat sich geändert, weil ich völlig vergessen habe, dass ich in "SomeFunc" einen doppelten Variablennamen hatte.
	MsgBox($MB_SYSTEMMODAL, $vReturn, "Die Variable hat sich jetzt geändert: " & $vVariableThatIsGlobal)
EndFunc   ;==>Example

Func SomeFunc()
	; Dies sollte eine Variable im lokalen Bereich erstellen, wenn der Variablenname noch nicht vorhanden ist.
	; Aus Gründen der Aussage habe ich völlig vergessen, dass ich bereits eine Variable mit demselben Namen deklariert habe.
	; Nun, ich möchte nur, dass dies in der Funktion geändert wird und nicht in der Variablen oben im Skript.
	; Sollte in Ordnung sein, oder? Denk nochmal.
	Dim $vVariableThatIsGlobal = ""

	For $i = 1 To 10
		$vVariableThatIsGlobal &= $i ; Dies gibt 12345678910 zurück und löscht den vorherigen Inhalt von $vVariableThatIsGlobal vollständig.
	Next
	Return $vVariableThatIsGlobal
EndFunc   ;==>SomeFunc
