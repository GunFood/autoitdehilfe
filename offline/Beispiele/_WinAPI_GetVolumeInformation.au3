#include <WinAPIFiles.au3>

Local $aData = _WinAPI_GetVolumeInformation()

ConsoleWrite('Volumename: ' & $aData[0] & @CRLF)
ConsoleWrite('Dateisystem: ' & $aData[4] & @CRLF)
ConsoleWrite('Seriennummer: ' & $aData[1] & @CRLF)
ConsoleWrite('Länge des Dateinamens: ' & $aData[2] & @CRLF)
ConsoleWrite('Flags: 0x' & Hex($aData[3]) & @CRLF)
