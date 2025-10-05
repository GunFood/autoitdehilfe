#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Platziert die Eingabebox oben links in der Ecke und zeigt die Zeichen an so wie sie eingegeben werden
	Local $sAnswer = InputBox("Frage", "Wo wurdest du geboren?", "Planet Erde", "", _
			 -1, -1, 0, 0)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $sAnswer)

	; Bittet den Benutzer ein Passwort einzugeben.
	; Nicht vergessen es mit Sternchen anzeigen zu lassen!
	Local $sPasswd = InputBox("Sicherheitscheck", "Bitte geben Sie ein Passwort ein.", "", "*")

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $sPasswd)

	; Erwartet vom Benutzer eine Eingabe von einem oder zwei Zeichen.
	; Das M im Passwortfeld bedeutet, dass eine leere Eingabe nicht angenommen wird.
	; Die 2 zeigt, dass maximal zwei Zeichen eingegeben werden dürfen
	Local $sValue = InputBox("Test", "Bitte geben Sie ein oder zwei Zeichen ein.", "", " M2")

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $sValue)
EndFunc   ;==>Example
