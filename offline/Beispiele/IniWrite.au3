#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Erstellt eine Konstante im lokalen Bereich des Dateipfades, welcher zum lesen bzw. schreiben verwendet wird.
	Local Const $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	; Schreibt den Wert von 'AutoIt' in den Schlüssel 'Titel' und in die Sektion 'General'.
	IniWrite($sFilePath, "General", "Titel", "AutoIt")

	; Liest in der ini-Datei den Wert von 'Titel' in der Sektion 'General'.
	Local $sRead = IniRead($sFilePath, "General", "Titel", "Default Value")

	; Zeigt den Wert der von IniRead zurückgegeben wurde.
	MsgBox($MB_SYSTEMMODAL, "", "Der Wert von 'Titel' in der Sektion 'General' lautet: " & $sRead)

	; Löscht den Schlüssel 'Titel'
	IniDelete($sFilePath, "General", "Titel")

	; Liest in der ini-Datei den Wert von 'Titel' in der Sektion 'General'.
	$sRead = IniRead($sFilePath, "General", "Titel", "Default Value")

	; Zeigt den Wert der von IniRead zurückgegeben wurde. Falls es dort keinen Schlüssel gibt, wird der Standardwert übergeben von IniRead angezeigt.
	MsgBox($MB_SYSTEMMODAL, "", "Der Wert von 'Titel' in der Sektion 'General' lautet: " & $sRead)

	; Löscht die ini-Datei.
	FileDelete($sFilePath)
EndFunc   ;==>Example
