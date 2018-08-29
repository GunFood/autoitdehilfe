#include <MsgBoxConstants.au3>

; Prüft, ob die Variable $vVar deklariert ist. Ist dies nicht der Fall, so erscheint eine Fehlermeldung.
If Not IsDeclared("vVar") Then
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable $vVar ist nicht deklariert.")

	Local $vVar = 0 ; Initialisiert die Variable $vVar mit Daten.
	If IsDeclared("vVar") Then ; Prüft, ob die Variable $vVar deklariert ist.
		MsgBox($MB_SYSTEMMODAL, "", "Die Variable $vVar ist deklariert.")
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Die Variable $vVar ist nicht deklariert.")
	EndIf
EndIf
