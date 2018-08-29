#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Weist einer Variable den Dateipfad zu, um zu prüfen, ob dieser eine Datei ist.
	Local $sFilePath = @ScriptFullPath

	If IsFile($sFilePath) Then
		MsgBox($MB_SYSTEMMODAL, "", "Der Dateipfad ist eine Datei.")
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Der Dateipfad ist keine Datei.")
	EndIf
EndFunc   ;==>Example

; Prüft, ob der Dateipfad eine Datei ist. Prüft nicht, ob die Datei existiert.
Func IsFile($sFilePath)
	Return StringInStr(FileGetAttrib($sFilePath), "D") = 0
EndFunc   ;==>IsFile
