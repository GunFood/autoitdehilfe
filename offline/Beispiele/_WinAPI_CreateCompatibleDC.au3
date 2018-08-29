#include <WinAPI.au3>
#include <WindowsConstants.au3>

$hGUI = GUICreate("test")

;erstellen
$hDC = _WinAPI_GetDC($hGUI)

$hBitmap = _WinAPI_CreateCompatibleBitmap($hDC, 100, 200)
$hBitmapDC = _WinAPI_CreateCompatibleDC($hDC)

_WinAPI_SelectObject($hBitmapDC, $hBitmap)

_WinAPI_ReleaseDC($hGUI, $hDC)

GUISetState()

;in Buffer zeichnen
$tRect = DllStructCreate("long[4]")
DllStructSetData($tRect, 1, 20, 1)
DllStructSetData($tRect, 1, 20, 2)
DllStructSetData($tRect, 1, 60, 3)
DllStructSetData($tRect, 1, 80, 4)
_WinAPI_FillRect($hBitmapDC, DllStructGetPtr($tRect), _WinAPI_GetSysColorBrush(2))


;Zeichnen
$hDC = _WinAPI_GetDC($hGUI)

_WinAPI_BitBlt($hDC, 10, 10, 100, 200, $hBitmapDC, 0, 0, $SRCCOPY)

_WinAPI_ReleaseDC($hGUI, $hDC)

Do
Until GUIGetMsg() = -3

;freigeben
_WinAPI_DeleteDC($hBitmapDC)
_WinAPI_DeleteObject($hBitmap)