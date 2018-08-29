#include <MsgBoxConstants.au3>

Local $var = DriveGetSerial(@HomeDrive & "\") ; Findet die Seriennummer des Hauptverzeichnisses des aktuellen Benutzers, normalerweise ist dies C:\.
MsgBox($MB_SYSTEMMODAL, "Seriennummer: ", $var)
