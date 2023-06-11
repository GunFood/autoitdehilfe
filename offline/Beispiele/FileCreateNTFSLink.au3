#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Erstellt eine Konstante im lokalen Bereich des Dateipfads der gelesen bzw. in den geschrieben werden soll.
	Local Const $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	; Erstellt eine temporäre Datei auf die verlinkt werden soll.
	If Not FileWrite($sFilePath, "Dies ist ein Beispiel für die Verwendung von FileCreateNTFSLink.") Then
		MsgBox($MB_SYSTEMMODAL, "", "Es ist während dem schreiben der temporären Datei ein Fehler aufgetreten.")
		Return False
	EndIf

	; Erstellt einen NTFS-Hardlink der .txt-Datei zu der .log-Datei auf dem Desktop.
	Local $iNTFSLink = FileCreateNTFSLink($sFilePath, @TempDir & "\ExampleNTFSLink.log")

	; Zeigt eine Nachricht, ob der NTFS-Hardlink erstellt wurde.
	If $iNTFSLink Then
		; Öffnet den Desktop-Ordner.
		ShellExecute(@TempDir)

		MsgBox($MB_SYSTEMMODAL, "", "Der NTFS-Hardlink wurde erstellt." & @CRLF & "FileCreateNTFSLink gibt folgendes zurück: " & $iNTFSLink)
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Der NTFS-Hardlink konnt nicht erstellt werden." & @CRLF & "FileCreateNTFSLink gibt folgendes zurück: " & $iNTFSLink)
	EndIf

	; Löscht die temporären Datei.
	FileDelete($sFilePath)
	FileDelete(@TempDir & "\ExampleNTFSLink.log")
EndFunc   ;==>Example
