#include <InetConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

; InetGet wartet, bis der Download abgeschlossen ist.

Beispiel()

Func Beispiel()
	; Speichert die heruntergeladene Datei im temporären Ordner.
	Local $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	; Lädt die Datei herunter und wartet, bis der Vorgang abgeschlossen ist. Die Option $INET_FORCERELOAD erzwingt das Neuladen vom entfernten Server.
	Local $iBytesSize = InetGet("http://www.autoitscript.com/autoit3/files/beta/update.dat", $sFilePath, $INET_FORCERELOAD)

	; Abrufen der Dateigröße.
	Local $iFileSize = FileGetSize($sFilePath)

	; Zeigt Details über die Gesamtzahl der gelesenen Bytes und die Dateigröße an.
	MsgBox($MB_SYSTEMMODAL, "", "Die Gesamtgröße des Downloads: " & $iBytesSize & @CRLF & _
			"Die gesamte Dateigröße: " & $iFileSize)

	; Löscht die temporäre lokale Datei.
	FileDelete($sFilePath)
EndFunc   ;==>Beispiel
