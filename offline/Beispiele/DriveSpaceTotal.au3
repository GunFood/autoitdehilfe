#include <MsgBoxConstants.au3>

Local $iTotalSpace = DriveSpaceTotal(@HomeDrive & "\") ; Findet den Gesamtspeicherplatz des Hauptverzeichnisses des aktuellen Benutzers, normalerweise ist dies C:\.
MsgBox($MB_SYSTEMMODAL, "Gesamtspeicherplatz", $iTotalSpace & " MB")
