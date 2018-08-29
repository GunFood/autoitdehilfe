#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Erstellt eine konstante Variable im lokalen Bereich des Dateipfades, welcher zum lesen bzw. schreiben verwendet wird.
	Local Const $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	; Erstellt eine Sektion in der ini mit der Struktur eines Strings.
	Local $sSection = "Title=AutoIt" & @LF & "Version=" & @AutoItVersion & @LF & "OS=" & @OSVersion

	; Schreibt den String in die Sektions 'General', 'Version' und 'andere'.
	IniWriteSection($sFilePath, "General", $sSection)
	IniWriteSection($sFilePath, "Version", $sSection)
	IniWriteSection($sFilePath, "andere", $sSection)

	; Benennt die Sektion 'General' in 'System' um.
	IniRenameSection($sFilePath, "General", "System")

	; Liest die Sektions der ini-Datei. Es wird ein 1D Array zurückgegeben.
	Local $aArray = IniReadSectionNames($sFilePath)

	; Prüft, ob ein Fehler aufgetreten ist.
	If Not @error Then
		; Durchläuft das Array und stellt die einzelnen Sektions dar.
		For $i = 1 To $aArray[0]
			MsgBox($MB_SYSTEMMODAL, "", "Sektion: " & $aArray[$i])
		Next
	EndIf

	; Löscht die ini-Datei.
	FileDelete($sFilePath)
EndFunc   ;==>Example
