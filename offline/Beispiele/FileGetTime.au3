#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Erstellt eine Konstante im lokalen Bereich des Dateipfads der gelesen bzw. geschrieben werden soll.
	Local Const $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	; Setzt den modifizierten Zeitstempel der Datei auf den 1. November 2003 und die aktuelle Zeit.
	Local $iFileSetTime = FileSetTime($sFilePath, "20031101", $FT_MODIFIED)

	; Zeigt den modifizierten Zeitstempel der Datei und gibt diesen im Format YYYYMMDDHHMMSS zurück.
	If $iFileSetTime Then
		MsgBox($MB_SYSTEMMODAL, "", "Zeitstempel:" & @CRLF & FileGetTime($sFilePath, $FT_MODIFIED, $FT_STRING))
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Es ist während dem setzen des Zeitstempels der Datei ein Fehler aufgetreten.")
	EndIf

	; Löscht die temporäre Datei.
	FileDelete($sFilePath)
EndFunc   ;==>Example
