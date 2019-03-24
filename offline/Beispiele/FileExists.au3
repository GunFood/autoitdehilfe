#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Erstellt eine Konstante im lokalen Bereich des Dateipfads der gelesen bzw. in den geschrieben werden soll.
	Local Const $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	Local $iFileExists = FileExists($sFilePath)

	; Zeigt eine Nachricht, ob die Datei existiert oder nicht.
	If $iFileExists Then
		MsgBox($MB_SYSTEMMODAL, "", "Die Datei existiert." & @CRLF & "FileExist gibt folgendes zurück: " & $iFileExists)
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Die Datei existiert nicht." & @CRLF & "FileExist gibt folgendes zurück: " & $iFileExists)
	EndIf

	; Löscht die temporäre Datei.
	FileDelete($sFilePath)
EndFunc   ;==>Example
