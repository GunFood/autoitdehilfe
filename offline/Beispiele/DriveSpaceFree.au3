#include <MsgBoxConstants.au3>

$iFreeSpace = DriveSpaceFree(@HomeDrive & "\") ; Findet den freien Speicherplatz des Hauptverzeichnisses des aktuellen Benutzers, normalerweise ist dies C:\.
MsgBox($MB_SYSTEMMODAL, "Freier Speicherplatz", $iFreeSpace & " MB")
