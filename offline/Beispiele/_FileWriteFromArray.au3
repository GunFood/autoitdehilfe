#include <File.au3>

; Listet alle Dateien im aktuellen Skriptverzeichnis auf
Local $aScriptDir = _FileListToArray(@ScriptDir)

; Erstellt eine Datei im User-%TEMP%-Ordner
Local $sFilePath = @TempDir & "\Examples.txt"

; Schreibt ein Array in eine Datei durch Übergabe des Dateinamens
_FileWriteFromArray($sFilePath, $aScriptDir, 1)

; Zeigt die Datei
ShellExecute($sFilePath)
