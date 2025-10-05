#include "Extras\HelpFileInternals.au3"

#include <WinAPIGdi.au3>
#include <WinAPIHObj.au3>
#include <WinAPIRes.au3>

Local $sBmp = _Extras_PathFull('AutoIt.bmp')
Local $hBitmap = _WinAPI_LoadImage(0, $sBmp, $IMAGE_BITMAP, 0, 0, $LR_LOADFROMFILE)
_WinAPI_DeleteObject($hBitmap)

ConsoleWrite(DllStructGetData($tSIZE, 'X') & ' x ' & DllStructGetData($tSIZE, 'Y') & @CRLF)
