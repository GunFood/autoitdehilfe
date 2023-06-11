
#include <MsgBoxConstants.au3>

Beispiel()

Func Beispiel()
	; Erstellt ein Objekt erster Klasse von MsgBox und weist es einer lokalen Variablen zu.
	Local $hMsgBox = MsgBox

	; Zeigt eine MsgBox unter Verwendung der zuvor zugewiesenen Variablen.
	$hMsgBox($MB_SYSTEMMODAL, "", "Dies ist ein Satz mit Whitespace.")

	; Prüft, ob $hMsgBox eine Funktion ist und zeigt das Ergebnis in einer MsgBox an.
	$hMsgBox($MB_SYSTEMMODAL, "", "Prüft, ob $hMsgBox eine Funktion ist oder nicht." & @CRLF & _
			@CRLF & _
			"Es wird der Wert 2 zurückgegeben, da die Funktion nativ ist: " & IsFunc($hMsgBox))
EndFunc   ;==>Beispiel
