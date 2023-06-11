#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Erstellt eine Konstante im lokalen Bereich des Dateipfads der gelesen bzw. in den geschrieben werden soll.
	Local Const $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	; Erstellt eine temporäre Datei von der Daten gelesen werden sollen.
	If Not FileWrite($sFilePath, "Dies ist ein Beispiel für die Verwendung von FileRecycle.") Then
		MsgBox($MB_SYSTEMMODAL, "", "Es ist während dem schreiben der temporären Datei ein Fehler aufgetreten.")
		Return False
	EndIf

	; Zeigt den Inhalt der Datei. Dabei wurde der Dateipfad an FileRead statt dem Handle von FileOpen verwendet.
	MsgBox($MB_SYSTEMMODAL, "", "Contents of the file:" & @CRLF & FileRead($sFilePath))

	; Löscht die temporäre Datei in den Papierkorb.
	Local $iRecycle = FileRecycle($sFilePath)

	; Zeigt eine Nachricht, ob die Datei gelöscht wurde und öffnet falls erfolgreich den Papierkorb.
	If $iRecycle Then
		MsgBox($MB_SYSTEMMODAL, "", "Die Datei wurde erfolgreich gelöscht.")

		; Öffnet den Papierkorb durch die Verwendung folgender CLSID.
		ShellExecute("::{645FF040-5081-101B-9F08-00AA002F954E}")
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Es ist während dem löschen der Datei ein Fehler aufgetreten.")
	EndIf
EndFunc   ;==>Example
