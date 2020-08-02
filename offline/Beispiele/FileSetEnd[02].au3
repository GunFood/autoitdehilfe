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

	; Schreibt Daten in die Datei mit dem von FileOpen zurückgegebenen Handle und setzt das Dateiende.
	FileWrite($hFileOpen, "ABCDEF")
	FileSetEnd($hFileOpen)

	; Zeigt die Dateigröße und Inhalt an.
	MsgBox($MB_SYSTEMMODAL, "", "Größe: " & FileGetSize($sFilePath) & @CRLF & "Daten: " & @CRLF & FileRead($sFilePath))

	; Erweitert die Größe auf 9 Bytes und schreibt keine weiteren Daten.
	FileSetPos($hFileOpen, 9, $FILE_BEGIN)
	FileSetEnd($hFileOpen)

	; Zeigt Dateigröße und Inhalt an.
	MsgBox($MB_SYSTEMMODAL, "", "Größe: " & FileGetSize($sFilePath) & @CRLF & "Daten: " & @CRLF & FileRead($sFilePath))

	; Verschiebt die Position hinter ABCDEF, im Bsp. 6 Bytes und schreibt zusätzliche Daten, welche die Datei auf 12 Bytes vergrößern.
	FileSetPos($hFileOpen, 6, $FILE_BEGIN)
	FileWrite($hFileOpen, "HIJKLM")
	FileSetEnd($hFileOpen) ; Setzen Sie das Dateiende.

	; Zeigt Dateigröße und Inhalt an.
	MsgBox($MB_SYSTEMMODAL, "", "Größe: " & FileGetSize($sFilePath) & @CRLF & "Daten: " & @CRLF & FileRead($sFilePath))

	; Kürzt die Datei auf 9 Bytes.
	FileSetPos($hFileOpen, 9, $FILE_BEGIN)
	FileSetEnd($hFileOpen) ; Setzen Sie das Dateiende.

	; Zeigt Dateigröße und Inhalt an.
	MsgBox($MB_SYSTEMMODAL, "", "Größe: " & FileGetSize($sFilePath) & @CRLF & "Daten: " & @CRLF & FileRead($sFilePath))

	; Schließt das von FileOpen zurückgegebene Handle.
	FileClose($hFileOpen)

	; Löscht die temporäre Datei.
	FileDelete($sFilePath)
EndFunc   ;==>Example
