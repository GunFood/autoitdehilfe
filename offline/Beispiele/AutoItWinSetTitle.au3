; Es ist zu prüfen, ob das Skript bereits läuft
; Es wird empfohlen dazu _Singleton von der Misc.au3 zu verwenden

#include <MsgBoxConstants.au3>

Local $sMyAutoItTitle = "ThisIsSomeUniqueStringThatOtherWindowsWontHave"

If WinExists($sMyAutoItTitle) Then
	; Das Skript läuft bereits

	MsgBox($MB_SYSTEMMODAL, Default, "Das Skript läuft bereits." & @CRLF & @CRLF & _
			"Die PID lautet: " & WinGetProcess($sMyAutoItTitle))
Else
	; Dies ist die erste Instanz des Skripts.

	; Setzt denFenstertitel von AutoIt
	AutoItWinSetTitle($sMyAutoItTitle)

	; Startet das Skript erneut.
	If @Compiled Then
		Run('"' & @ScriptFullPath & '"')
	Else
		Run('"' & @AutoItExe & '" "' & @ScriptFullPath & '"')
	EndIf

	MsgBox($MB_SYSTEMMODAL, Default, "Dies ist die erste Instanz." & @CRLF & @CRLF & _
			"Meinbe PID lautet: " & @AutoItPID)
EndIf
