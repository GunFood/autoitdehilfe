#include <MsgBoxConstants.au3>

Local $sFileSystem = DriveGetFileSystem(@HomeDrive & "\") ; Findet den Dateisystem Typ des Hauptverzeichnisses des aktuellen Benutzers, normalerweise ist dies C:\.
MsgBox($MB_SYSTEMMODAL, "Dateisystem Typ:", $sFileSystem)
