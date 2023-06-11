#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Ermittelt die Daten der Zwischenablage
	Local $sData = ClipGet()

	; Zeigt die Daten die von ClipGet zurückgegeben wurden.
	MsgBox($MB_SYSTEMMODAL, "", "Die folgenden Daten sind in der Zwischenablage gespeichert: " & @CRLF & $sData)

	; Fügt neue Daten in die Zwischenablage hinzu
	ClipPut("Ein neuer String wurde in die Zwischenablage hinzugefügt.")

	; Ermittelt die Daten der Zwischenablage
	$sData = ClipGet()

	; Zeigt die Daten die von ClipGet zurückgegeben wurden.
	MsgBox($MB_SYSTEMMODAL, "", "The following data is now stored in the clipboard: " & @CRLF & $sData)
EndFunc   ;==>Example
