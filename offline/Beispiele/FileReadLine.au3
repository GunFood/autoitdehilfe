#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Erstellt eine Konstante im lokalen Bereich des Dateipfads der gelesen bzw. in den geschrieben werden soll.
	Local Const $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	; Erstellt eine temporäre Datei von der Dateien gelesen werden sollen.
	If Not FileWrite($sFilePath, "Dies ist ein Beispiel für die Verwendung von FileReadLine.") Then
		MsgBox($MB_SYSTEMMODAL, "", "Es ist während dem schreiben der temporären Datei ein Fehler aufgetreten.")
		Return False
	EndIf

	; Öffnet die Datei zum lesen und speichert das Handle in einer Variable.
	Local $hFileOpen = FileOpen($sFilePath, $FO_READ)
	If $hFileOpen = -1 Then
		MsgBox($MB_SYSTEMMODAL, "", "Es ist während dem lesen der Datei ein Fehler aufgetreten.")
		Return False
	EndIf

	; Liest die erste Zeile der Datei. Dabei wird das von FileOpen zurückgegebene Handle verwendet.
	Local $sFileRead = FileReadLine($hFileOpen, 1)

	; Schließt das Handle welches von FileOpen zurückgegeben wurde.
	FileClose($hFileOpen)

	; Zeigt die erste Zeile der Datei.
	MsgBox($MB_SYSTEMMODAL, "", "Erste Zeile der Datei:" & @CRLF & $sFileRead)

	; Löscht die temporären Datei.
	FileDelete($sFilePath)
EndFunc   ;==>Example
