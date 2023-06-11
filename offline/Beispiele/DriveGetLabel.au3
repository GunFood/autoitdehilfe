#include <MsgBoxConstants.au3>

Local $sLabel = DriveGetLabel(@HomeDrive & "\") ; Findet die Laufwerksbezeichnung des Hauptverzeichnisses des aktuellen Benutzers, normalerweise ist dies C:\.
MsgBox($MB_SYSTEMMODAL, "Laufwerksbezeichnung: ", $sLabel)
