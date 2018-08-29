#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine konstante Variable im lokalen Bereich des Dateipfads der Verknüpfung.
	Local Const $sFilePath = @DesktopDir & "\FileGetShortcutExample.lnk"

	; Erstellt eine Verknüpfung zur explorer.exe auf dem Desktop. Dabei wird der Tastenkombination Ctrl+Alt+T oder in AutoIt ^!t gesetzt.
	FileCreateShortcut(@WindowsDir & "\explorer.exe", $sFilePath, @WindowsDir, "/e,c:\", _
			"Tooltip Bescbreibung der Verknüpfung", @SystemDir & "\shell32.dll", "^!t", "15", @SW_SHOWMINNOACTIVE)

	; Ermittelt Details zu der Verknüpfung.
	Local $aDetails = FileGetShortcut($sFilePath)
	If Not @error Then
		MsgBox($MB_SYSTEMMODAL, "", "Pfad: " & $aDetails[0] & @CRLF & _
				"Arbeitsverzeichnis: " & $aDetails[1] & @CRLF & _
				"Argumente: " & $aDetails[2] & @CRLF & _
				"Bescbreibung: " & $aDetails[3] & @CRLF & _
				"Dateiname des Icons: " & $aDetails[4] & @CRLF & _
				"Index des Icons: " & $aDetails[5] & @CRLF & _
				"Verknüpfungsstatus: " & $aDetails[6] & @CRLF)
	EndIf

	; Löscht die Verknüpfung.
	FileDelete($sFilePath)
EndFunc   ;==>Example
