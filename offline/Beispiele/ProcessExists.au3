#include <MsgBoxConstants.au3>

If ProcessExists("notepad.exe") Then ; Prüft, ob der Notepad Prozess läuft
	MsgBox($MB_SYSTEMMODAL, "", "Der Editor läuft.")
Else
	MsgBox($MB_SYSTEMMODAL, "", "Der Editor läuft nicht.")
EndIf
