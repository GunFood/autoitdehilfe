#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Erstellt eine Konstante im lokalen Bereich des Dateipfads der gelesen bzw. in den geschrieben werden soll.
	Local Const $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	; Erstellt eine temporäre Datei in die Daten geschrieben werden sollen.
	If Not FileWrite($sFilePath, "Start des FileWriteLine Beispiels, Zeile 1. " & @CRLF) Then
		MsgBox($MB_SYSTEMMODAL, "", "Es ist während dem schreiben der temporären Datei ein Fehler aufgetreten.")
		Return False
	EndIf

	; Öffnet die Datei zum schreiben (hängt den Text an das Ende der Datei) und speichert das Handle in einer Variable.
	Local $hFileOpen = FileOpen($sFilePath, $FO_APPEND)
	If $hFileOpen = -1 Then
		MsgBox($MB_SYSTEMMODAL, "", "Es ist während dem lesen der Datei ein Fehler aufgetreten.")
		Return False
	EndIf

	; Schreibt durch die Verwendung des von FileOpen zurückgegebenen Handles Daten in die Datei.
	FileWriteLine($hFileOpen, "Zeile 2")
	FileWriteLine($hFileOpen, "Dies ist mit Zeile 3 eine neue Zeile, da eine neue Zeile beim letzten Aufruf von FileWriteLines angehängt wurde." & @CRLF)
	FileWriteLine($hFileOpen, "Zeile 4" & @CRLF)
	FileWriteLine($hFileOpen, "Zeile 5")

	; Schließt das Handle welches von FileOpen zurückgegeben wurde.
	FileClose($hFileOpen)

	; Zeigt den Inhalt der Datei. Dabei wird der Dateipfad statt dem durch FileOpen zurückgegebenen Handle an FileRead übergeben.
	MsgBox($MB_SYSTEMMODAL, "", "Inhalt der Datei:" & @CRLF & FileRead($sFilePath))

	; Löscht die temporären Datei.
	FileDelete($sFilePath)
EndFunc   ;==>Example
