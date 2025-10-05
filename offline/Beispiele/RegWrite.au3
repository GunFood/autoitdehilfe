#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Prüft, ob der Registryschlüssel bereits existiert, damit das System es Benutzers nicht beschädigt wird.
	RegRead("HKEY_CURRENT_USER\Software\AutoIt_Example", "Key1")

	; setzt das @error Flag auf ungleich 0, wenn ein Registryschlüssel gelesen wird der nicht existiert.
	If Not @error Then
		MsgBox($MB_SYSTEMMODAL, "", "Ein Fehler ist aufgetreten, dass der temporäre Registryschlüssel ""AutoIt_Example"" bereits existiert.")
		Return False
	EndIf

	; Schreibt einen einzelnen REG_SZ Wert in den Schlüssel "Key1".
	RegWrite("HKEY_CURRENT_USER\Software\AutoIt_Example", "Key1", "REG_SZ", "Dies ist ein Beispiel von RegWrite")

	; Schreibt den REG_MULTI_SZ Wert von "Zeile 1" und "Zeile 2". Es iwrd immer ein Zeilenvoschubzeichen angehängt wenn ein REG_MULTI_SZ Wert geschrieben wird.
	RegWrite("HKEY_CURRENT_USER\Software\AutoIt_Example", "Key2", "REG_MULTI_SZ", "Zeile 1" & @LF & "Zeile 2" & @LF)

	; Schreibt den REG_MULTI_SZ Wert von "Zeile 1". Es iwrd immer ein Zeilenvoschubzeichen angehängt wenn ein REG_MULTI_SZ Wert geschrieben wird.
	RegWrite("HKEY_CURRENT_USER\Software\AutoIt_Example", "Key3", "REG_MULTI_SZ", "Zeile 1" & @LF)

	; Zeigt eine Nachricht um manuell zu dem Registryschlüssel zu navigieren.
	MsgBox($MB_SYSTEMMODAL, "", "Es ist RegEdit.exe zu öffnen und zu dem Registryschlüssel ""HKEY_CURRENT_USER\Software\AutoIt_Example"" zu navigieren.")

	; Löscht den temporären Registryschlüssel.
	RegDelete("HKEY_CURRENT_USER\Software\AutoIt_Example")
EndFunc   ;==>Example
