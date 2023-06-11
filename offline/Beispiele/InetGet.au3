#include <InetConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

; InetGet downloaded eine Datei im Hintergrund.
; Das AutoIt Skript prüft in einer Schleife, ob der Download vollständig ist.

Example()

Func Example()
	; Speichert die heruntergeladene Datei in den temporären Ordner.
	Local $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	; Lädt die Datei im Hintergrund mit den ausgewählten Optionen von 'Erzwingt ein erneutes Laden von der Remote-Seite' herunter.
	Local $hDownload = InetGet("http://www.autoitscript.com/autoit3/files/beta/update.dat", $sFilePath, $INET_FORCERELOAD, $INET_DOWNLOADBACKGROUND)

	; Wartet bis der Download komplett ist. Dabei wird solange gewartet, bis der zweite Wert von InetGetInfo True zurückgibt.
	Do
		Sleep(250)
	Until InetGetInfo($hDownload, $INET_DOWNLOADCOMPLETE)

	; Ermittelt die übertragenen Bytes und die Dateigröße.
	Local $iBytesSize = InetGetInfo($hDownload, $INET_DOWNLOADREAD)
	Local $iFileSize = FileGetSize($sFilePath)

	; Schließt das durch InetGet zurückgegebene Handle.
	InetClose($hDownload)

	; Zeigt Details über die gelesenen Bytes und die Dateigröße.
	MsgBox($MB_SYSTEMMODAL, "", "heruntergeladene Bytes: " & $iBytesSize & @CRLF & _
			"gesamte Dateigröße: " & $iFileSize)

	; Löscht die Datei.
	FileDelete($sFilePath)
EndFunc   ;==>Example
