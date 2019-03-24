#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Erstellt eine Konstante im lokalen Bereich des Dateipfads der gelesen bzw. in den geschrieben werden soll.
	Local Const $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	; Öffnet die Datei für das schreiben (überschreibt die Datei) und speichert das Handle in einer Variable.
	Local $hFileOpen = FileOpen($sFilePath, $FO_OVERWRITE)
	If $hFileOpen = -1 Then
		MsgBox($MB_SYSTEMMODAL, "", "Es ist während dem lesen der Datei ein Fehler aufgetreten.")
		Return False
	EndIf

	; Schreibt Daten in die Datei. Dabei wird das durch FileOpen zurückgegebene Handle verwendet.
	FileWriteLine($hFileOpen, "Zeile 1")
	FileWriteLine($hFileOpen, "Zeile 2")
	FileWriteLine($hFileOpen, "Zeile 3")

	; Entleert den Dateipuffer auf die Festplatte.
	FileFlush($hFileOpen)

	; Prüft die Dateiposition und versucht den Inhalt der aktuellen Position zu lesen.
	MsgBox($MB_SYSTEMMODAL, "", "Position: " & FileGetPos($hFileOpen) & @CRLF & "Daten: " & @CRLF & FileRead($hFileOpen))

	; Nun wird die Position des Starts festgelegt.
	FileSetPos($hFileOpen, 0, $FILE_BEGIN)

	; Prüft die Dateiposition und versucht den Inhalt der aktuellen Position zu lesen.
	MsgBox($MB_SYSTEMMODAL, "", "Position: " & FileGetPos($hFileOpen) & @CRLF & "Daten: " & @CRLF & FileRead($hFileOpen))

	; Schließt das Handle welches von FileOpen zuürckgegeben wurde.
	FileClose($hFileOpen)

	; Löscht die temporäre Datei.
	FileDelete($sFilePath)
EndFunc   ;==>Example
