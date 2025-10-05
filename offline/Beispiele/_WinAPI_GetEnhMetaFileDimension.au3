#include "Extras\HelpFileInternals.au3"

#include <WinAPIGdi.au3>

Local $sEmf = _Extras_PathFull('Flag.emf')
Local $hEmf = _WinAPI_GetEnhMetaFile($sEmf)
Local $tSIZE = _WinAPI_GetEnhMetaFileDimension($hEmf)
_WinAPI_DeleteEnhMetaFile($hEmf)

ConsoleWrite(DllStructGetData($tSIZE, 'X') & ' x ' & DllStructGetData($tSIZE, 'Y') & @CRLF)
