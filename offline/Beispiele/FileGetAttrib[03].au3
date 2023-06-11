#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Weist einer Variable den Dateipfad zu, um zu prüfen, ob dieser ein Ordner ist.
	Local $sFilePath = @ScriptDir

	If IsDir($sFilePath) Then
		MsgBox($MB_SYSTEMMODAL, "", "Der Dateipfad ist ein Ordner.")
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Der Dateipfad ist kein Ordner.")
	EndIf
EndFunc   ;==>Example

; Prüft, ob der Dateipfad ein Ordner ist. Prüft nicht, ob der Ordner existiert.
Func IsDir($sFilePath)
	Return StringInStr(FileGetAttrib($sFilePath), "D") > 0
EndFunc   ;==>IsDir
