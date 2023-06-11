
#include <MsgBoxConstants.au3>

Beispiel()

Func Beispiel()
	; Erstellt ein Objekt erster Klasse von MsgBox und weist es einer lokalen Variablen zu.
	Local $hMsgBox = MsgBox

	; Zeigt eine MsgBox unter Verwendung der zuvor zugewiesenen Variablen an.
	$hMsgBox($MB_SYSTEMMODAL, "", "Dies ist ein Satz mit Whitespace.")

	; Weist die Variable $hMsgBox mit unserer benutzerdefinierten Messagebox-Funktion neu zu.
	$hMsgBox = MeineMsgBox

	; Prüft, ob $hMsgBox eine Funktion ist und zeigt das Ergebnis in einer MsgBox an.
	$hMsgBox($MB_SYSTEMMODAL, "", "Prüft, ob $hMsgBox eine Funktion ist oder nicht." & @CRLF & _
			@CRLF & _
			"Es wird der Wert 1 zurückgegeben, da die Funktion eine Benutzerfunktion ist: " & IsFunc($hMsgBox))
EndFunc   ;==>Beispiel

; Benutzerdefinierte MsgBox-Funktion.
Func MeineMsgBox($iFlag, $sTitle, $sText = "")
	Return MsgBox($iFlag, $sTitle, $sText)
EndFunc   ;==>MeineMsgBox
