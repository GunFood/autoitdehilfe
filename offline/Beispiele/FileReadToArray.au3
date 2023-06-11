#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Liest die aktuelle Skriptdatei in eine Array ein. Dabei wird der Dateipfad verwendet.
	Local $aArray = FileReadToArray(@ScriptFullPath)
	Local $iLineCount = @extended
	If @error Then
		MsgBox($MB_SYSTEMMODAL, "", "Beim lesen der Datei ist ein Fehler aufgetreten. @error: " & @error) ; Beim lesen der Datei ist ein Fehler aufgetreten.
	Else
		For $i = 0 To $iLineCount - 1 ; Durchläuft das Array. UBound($aArray) kann auch verwendet werden
			MsgBox($MB_SYSTEMMODAL, "", $aArray[$i]) ; Zeigt den Inhalt des Arrays.
		Next
	EndIf
EndFunc   ;==>Example
