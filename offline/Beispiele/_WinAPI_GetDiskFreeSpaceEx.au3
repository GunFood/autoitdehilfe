#include <WinAPIFiles.au3>

Local $aData = _WinAPI_GetDiskFreeSpaceEx(@HomeDrive)

ConsoleWrite('Gesamter verfügbarer freier Speicher auf ' & @HomeDrive & ' => ' & $aData[0] & ' bytes' & @CRLF)
ConsoleWrite('Gesamter verfügbarer Speicher auf ' & @HomeDrive & ' => ' & $aData[1] & ' bytes' & @CRLF)
ConsoleWrite('Gesamter freier Speicher auf ' & @HomeDrive & ' => ' & $aData[2] & ' bytes' & @CRLF)
