#include <Misc.au3>
#include <MsgBoxConstants.au3>

If _Singleton("Skript", 1) = 0 Then
	MsgBox($MB_SYSTEMMODAL, "Warnung", "Eine Instanz des Skripts wird bereits ausgeführt!")
	Exit
EndIf
MsgBox($MB_SYSTEMMODAL, "Alles i.O.", "Die erste Instanz des Skripts läuft.")
