#include "Extras\HelpFileInternals.au3"

#include <WinAPIGdi.au3>

Local $sEmf = _Extras_PathFull('Flag.emf')
Local $hEmf = _WinAPI_GetEnhMetaFile($sEmf)
Local $aData = _WinAPI_GetEnhMetaFileDescription($hEmf)
_WinAPI_DeleteEnhMetaFile($hEmf)

ConsoleWrite('Anwendung: ' & $aData[0] & @CRLF)
ConsoleWrite('Bild:     ' & $aData[1] & @CRLF)
