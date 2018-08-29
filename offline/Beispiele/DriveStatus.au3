#include <MsgBoxConstants.au3>

Local $sStatus = DriveStatus(@HomeDrive & "\"); Findet den Status des Hauptverzeichnisses des aktuellen Benutzers, normalerweise ist dies C:\.
MsgBox($MB_SYSTEMMODAL, "Status", $sStatus)
