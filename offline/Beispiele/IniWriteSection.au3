#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Erstellt eine Konstante im lokalen Bereich des Dateipfades, welcher zum lesen bzw. schreiben verwendet wird.
	Local Const $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	; Erstellt eine Sektion in der ini mit der Struktur eines Strings. Das Element bei Index 0 enthält die Anzahl der Items im Array, in diesem Fall 3.
	Local $aSection[4][2] = [[3, ""], ["Title", "AutoIt"], ["Version", @AutoItVersion], ["OS", @OSVersion]]

	; Schreibt das Arra in die Sektion 'General'.
	IniWriteSection($sFilePath, "General", $aSection)

	; Liest die Sektion 'General'. Es wird ein 2D Array zurückgegeben.
	Local $aArray = IniReadSection($sFilePath, "General")

	; Prüft, ob ein Fehler aufgetreten ist.
	If Not @error Then
		; Durchläuft das Array und stellt die einzelnen Schlüssel und deren Werte dar.
		For $i = 1 To $aArray[0][0]
			MsgBox($MB_SYSTEMMODAL, "", "Schlüssel: " & $aArray[$i][0] & @CRLF & "Wert: " & $aArray[$i][1])
		Next
	EndIf

	; Löscht die ini-Datei.
	FileDelete($sFilePath)
EndFunc   ;==>Example
