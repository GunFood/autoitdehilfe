#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

; Erstellt eine Liste mit allen CDRom's
Local $aCDRom = DriveGetDrive($DT_CDROM)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "", "Kein CDRom gefunden.")
	Exit
EndIf

; Öffnet das CD-Fach des ersten CDRom's
CDTray($aCDRom[1], $CDTRAY_OPEN)
Sleep(2000)
CDTray($aCDRom[1], $CDTRAY_CLOSED) ; funktioniert nicht bei Laptop-CDRom's welche nur manuell geschlossen werden können.
