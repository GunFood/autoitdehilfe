#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Erstellt eine Konstante im lokalen Bereich des Dateipfads der gelesen bzw. in den geschrieben werden soll.
	Local Const $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	; Öffnet eine Datei für den Lese/Schreib-Zugriff.
	Local $hFileOpen = FileOpen($sFilePath, $FO_READ + $FO_OVERWRITE)
	If $hFileOpen = -1 Then
		MsgBox($MB_SYSTEMMODAL, "", "Es ist während des Lesens der temporären Datei ein Fehler aufgetreten.")
		Return False
	EndIf

	; Schreibt etwas Text.
	FileWrite($hFileOpen, "Dies ist etwas Text um zu zeigen, dass das Handle mit Lese/Schreib-Zugriff geöffnet wurde." & @CRLF)

	; Ermittelt die aktuelle Position in der Datei.
	Local $iFilePos = FileGetPos($hFileOpen)

	; Nun wird die Position des Starts festgelegt.
	FileSetPos($hFileOpen, 0, $FILE_BEGIN)

	; Zeigt den Inhalt der Datei.
	MsgBox($MB_SYSTEMMODAL, "", FileRead($hFileOpen))

	; Die Position wird auf die vorherige Position gesetzt.
	FileSetPos($hFileOpen, 0, $iFilePos)

	; Schreibt nochmals etwas Text.
	FileWrite($hFileOpen, "Dies ist etwas zusätzlicher Text.")

	; Die Position wird auf die vorherige Position gesetzt.
	FileSetPos($hFileOpen, 0, $FILE_BEGIN)

	; Zeigt den Inhalt der Datei.
	MsgBox($MB_SYSTEMMODAL, "", FileRead($hFileOpen))

	; Schließt das Handle, welches von FileOpen zurückgegeben wurde.
	FileClose($hFileOpen)

	; Löscht die temporäre Datei.
	FileDelete($sFilePath)

	Return True
EndFunc   ;==>Example
