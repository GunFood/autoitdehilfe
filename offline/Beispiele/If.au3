#include <MsgBoxConstants.au3>

; Beendet das Skript wenn keine Kommandozeilen Befehle vorliegen.
If $CmdLine[0] = 0 Then Exit

; Alternativ:
If $CmdLine[0] = 0 Then
	Exit
EndIf

MsgBox($MB_SYSTEMMODAL, "", "Das Skript entält Kommandozeilenparameter.")
