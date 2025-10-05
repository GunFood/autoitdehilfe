#include "Extras\HelpFileInternals.au3"

#include <WinAPIRes.au3>

Local $hPrev = _WinAPI_CopyCursor(_WinAPI_LoadCursor(0, $OCR_NORMAL))

Local $sCur = _Extras_PathFull('Lens.cur')
_WinAPI_SetSystemCursor(_WinAPI_LoadCursorFromFile($sCur), $OCR_NORMAL)
Sleep(5000)
_WinAPI_SetSystemCursor($hPrev, $OCR_NORMAL)