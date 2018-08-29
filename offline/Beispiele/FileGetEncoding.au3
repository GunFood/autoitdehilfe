#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iEncoding = FileGetEncoding(@ScriptFullPath) ; Liest die Zeichenkodierung der Scriptdatei aus
	If @error Then
		MsgBox($MB_SYSTEMMODAL, "Error", "Konnte keine Kodierung auslesen.")
	Else
		MsgBox($MB_SYSTEMMODAL, "FileGetEncoding", "Der zurückgegebene Wert ist: " & $iEncoding) ; Der zurückgegebene Wert für dieses Beispiel sollte 0 bzw. $FO_ANSI sein.
	EndIf
EndFunc   ;==>Example
