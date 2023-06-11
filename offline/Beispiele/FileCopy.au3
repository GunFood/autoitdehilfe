#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Erstellt eine Konstante im lokalen Bereich des Dateipfads der gelesen bzw. in den geschrieben werden soll.
	Local Const $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	; Erstellt eine temporäre Datei zum kopieren.
	If Not FileWrite($sFilePath, "Dies ist ein Beispiel für die Verwendung von FileCopy.") Then
		MsgBox($MB_SYSTEMMODAL, "", "Es ist während dem schreiben der temporären Datei ein Fehler aufgetreten.")
		Return False
	EndIf

	; Kopiert au3-Dateien in das temporäre Verzeichnis in einen neuen Ordner namens Au3Files.
	FileCopy(@TempDir & "\*.au3", @TempDir & "\Au3Files\", $FC_OVERWRITE + $FC_CREATEPATH)

	; Zeigt das temporäre Verzeichnis.
	ShellExecute(@TempDir)
EndFunc   ;==>Example
