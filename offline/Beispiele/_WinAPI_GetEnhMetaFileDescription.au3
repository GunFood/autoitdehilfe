#include <WinAPIGdi.au3>

Local $hEmf = _WinAPI_GetEnhMetaFile(@ScriptDir & '\Extras\Flag.emf')
Local $aData = _WinAPI_GetEnhMetaFileDescription($hEmf)
_WinAPI_DeleteEnhMetaFile($hEmf)

ConsoleWrite('Anwendung: ' & $aData[0] & @CRLF)
ConsoleWrite('Bild:     ' & $aData[1] & @CRLF)
