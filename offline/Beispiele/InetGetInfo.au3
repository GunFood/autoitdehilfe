#include <InetConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

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

	; Ermittelt Details über die heruntergeladene Datei.
	Local $aData = InetGetInfo($hDownload)
	If @error Then
		FileDelete($sFilePath)
		Return False ; Falls ein Fehler, so wird die Funktion verlassen und die Datei gelöscht.
	EndIf

	; Schließt das durch InetGet zurückgegebene Handle.
	InetClose($hDownload)

	; Zeigt Details über die heruntergeladene Datei.
	MsgBox($MB_SYSTEMMODAL, "", "gelesene Bytes: " & $aData[$INET_DOWNLOADREAD] & @CRLF & _
			"Größe: " & $aData[$INET_DOWNLOADSIZE] & @CRLF & _
			"Vollständig: " & $aData[$INET_DOWNLOADCOMPLETE] & @CRLF & _
			"Erfolgreich: " & $aData[$INET_DOWNLOADSUCCESS] & @CRLF & _
			"@error: " & $aData[$INET_DOWNLOADERROR] & @CRLF & _
			"@extended: " & $aData[$INET_DOWNLOADEXTENDED] & @CRLF)

	; Löscht die Datei.
	FileDelete($sFilePath)
EndFunc   ;==>Example
