#include <File.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Erstellt eine konstante Variablen im lokalen Bereich des Dateipfads, in welchem gelesen bzw. geschrieben wird.
	Local Const $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	; Erstellt Daten die in die Datei geschrieben werden soll.
	Local $sData = "Zeile 1: Dies ist ein Beispiel von der Verwendung von _FileWriteToLine()" & @CRLF & _
			"Zeile 2: Dies ist ein Beispiel von der Verwendung von _FileWriteToLine()" & @CRLF & _
			"Zeile 3: Dies ist ein Beispiel von der Verwendung von _FileWriteToLine()" & @CRLF & _
			"Zeile 4: Dies ist ein Beispiel von der Verwendung von _FileWriteToLine()" & @CRLF & _
			"Zeile 5: Dies ist ein Beispiel von der Verwendung von _FileWriteToLine()" & @CRLF

	; Erstellt eine temporäre Datei von der Daten gelesen werden sollen.
	If Not FileWrite($sFilePath, $sData) Then
		MsgBox($MB_SYSTEMMODAL, "", "Es ist ein Fehler aufgetreten während die temporäre Datei geschrieben wurde.")
		Return False
	EndIf

	; Schreibt in Zeile 3, mit aktiviertem Überschreibemodus (true).
	_FileWriteToLine($sFilePath, 3, "Zeile 3: DIES WURDE ERSETZT", True)

	; Liest den Inhalt der Datei durch Verwendung des Dateipfads.
	Local $sFileRead = FileRead($sFilePath)

	; Zeigt den Inhalt der Datei an.
	MsgBox($MB_SYSTEMMODAL, "", "Inhalt der Datei:" & @CRLF & $sFileRead)

	; Schreibt in Zeile 3 mit deaktiviertem Überschreibemodus (false).
	_FileWriteToLine($sFilePath, 3, "Zeile 3: DIES WURDE EINGEFÜGT", False)

	; Liest den Inhalt der Datei durch Verwendung des Dateipfads.
	$sFileRead = FileRead($sFilePath)

	; Zeigt den Inhalt der Datei an.
	MsgBox($MB_SYSTEMMODAL, "", "Inhalt der Datei:" & @CRLF & $sFileRead)

	; Löscht die temporäre Datei.
	FileDelete($sFilePath)
EndFunc   ;==>Example
