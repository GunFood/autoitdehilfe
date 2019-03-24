#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Erstellt eine Konstante im lokalen Bereich des Dateipfads der gelesen bzw. in den geschrieben werden soll.
	Local Const $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	; Erstellt eine temporäre Datei von der Dateien gelesen werden sollen.
	If Not FileWrite($sFilePath, "Dies ist ein Beispiel für die Verwendung von FileOpen.") Then
		MsgBox($MB_SYSTEMMODAL, "", "Es ist während dem schreiben der temporären Datei ein Fehler aufgetreten.")
		Return False
	EndIf

	; Öffnet die Datei zum lesen und speichert das Handle in einer Variable.
	Local $hFileOpen = FileOpen($sFilePath, $FO_READ)
	If $hFileOpen = -1 Then
		MsgBox($MB_SYSTEMMODAL, "", "Es ist während dem lesen der Datei ein Fehler aufgetreten.")
		Return False
	EndIf

	; Liest den Inhalt der Datei durch die Verwendung des von FileOpen zurückgegebenen Handles.
	Local $sFileRead = FileRead($hFileOpen)

	; Schließt das Handle welches von FileOpen zurückgegeben wurde.
	FileClose($hFileOpen)

	; Zeigt den Inhalt der Datei.
	MsgBox($MB_SYSTEMMODAL, "", "Inhalt der Datei:" & @CRLF & $sFileRead)

	; Löscht die temporäre Datei.
	FileDelete($sFilePath)
EndFunc   ;==>Example
