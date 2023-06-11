#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

Local $aArray = DriveGetDrive($DT_ALL)
If @error Then
	; Es trat ein Fehler während dem ermitteln der Laufwerke auf.
	MsgBox($MB_SYSTEMMODAL, "DriveGetDrive", "Ein Fehler trat auf.")
Else
	For $i = 1 To $aArray[0]
		; Zeigt alle gefundenen Laufwerke. Der Laufwerksbuchstabe wurde auf Großschreibung geändert.
		MsgBox($MB_SYSTEMMODAL, "DriveGetDrive", "Laufwerk " & $i & "/" & $aArray[0] & ":" & @CRLF & StringUpper($aArray[$i]))
	Next
EndIf
