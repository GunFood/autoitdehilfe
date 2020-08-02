#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Erstellt eine Konstante des Dateipfades, der zum Lesen/Schreiben verwendet wird.
	Local Const $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	; Öffnet die Datei zum Schreiben (überschreiben Sie die Datei) und speichert das Handle in einer Variablen.
	Local $hFileOpen = FileOpen($sFilePath, $FO_OVERWRITE)
	If $hFileOpen = -1 Then
		MsgBox($MB_SYSTEMMODAL, "", "Beim Schreiben der temporären Datei ist ein Fehler aufgetreten.")
		Return False
	EndIf

	; Schreibt Daten in die Datei mit dem von FileOpen zurückgegebenen Handle.
	FileWriteLine($hFileOpen, "Zeile 1")
	FileWriteLine($hFileOpen, "Zeile 2")
	FileWriteLine($hFileOpen, "Zeile 3")

	; Leert die Datei auf die Festplatte.
	FileFlush($hFileOpen)

	; Setzt jetzt die Position auf den Anfang.
	FileSetPos($hFileOpen, 0, $FILE_BEGIN)

	; Überprüft die Dateiposition und versucht, den Inhalt an der aktuellen Position zu lesen.
	MsgBox($MB_SYSTEMMODAL, "", "Position: " & FileGetPos($hFileOpen) & @CRLF & "Daten: " & @CRLF & FileRead($hFileOpen))

	; Schreibt Daten in die Datei mit dem von FileOpen zurückgegebenen Handle.
	FileWriteLine($hFileOpen, "Zeile 4")
	FileWriteLine($hFileOpen, "Zeile 5")
	FileWriteLine($hFileOpen, "Zeile 6")

	; Setzt jetzt die Position auf den Anfang.
	FileSetPos($hFileOpen, 0, $FILE_BEGIN)

	; Überprüft die Dateiposition und versucht den Inhalt an der aktuellen Position zu lesen.
	MsgBox($MB_SYSTEMMODAL, "", "Position: " & FileGetPos($hFileOpen) & @CRLF & "Daten: " & @CRLF & FileRead($hFileOpen))

	; Setzt jetzt die Position auf den Anfang.
	FileSetPos($hFileOpen, 0, $FILE_BEGIN)

	; Setzt die aktuelle Position als Dateiende.
	FileSetEnd($hFileOpen)

	; Überprüft die Dateiposition und versucht den Inhalt an der aktuellen Position zu lesen. Der Inhalt wurde zerstört.
	MsgBox($MB_SYSTEMMODAL, "", "Position: " & FileGetPos($hFileOpen) & @CRLF & "Daten: " & @CRLF & FileRead($hFileOpen))

	; Schließt das von FileOpen zurückgegebene Handle.
	FileClose($hFileOpen)

	; Löscht die temporäre Datei.
	FileDelete($sFilePath)
EndFunc   ;==>Example
