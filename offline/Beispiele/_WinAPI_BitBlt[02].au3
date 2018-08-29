#include <WinAPI.au3>
#include <WindowsConstants.au3>

$hGui = GUICreate("_WinAPI_BitBlt", 640, 480)
GUISetState()
$hWnd = _WinAPI_GetDesktopWindow()

$hDC_Gui = _WinAPI_GetDC($hGui)
$hDC_Desk = _WinAPI_GetDC($hWnd)

_WinAPI_BitBlt($hDC_Gui, 0, 0, 640, 480, $hDC_Desk, 0, 0, $SRCINVERT)
_WinAPI_BitBlt($hDC_Gui, 100, 100, 320, 240, $hDC_Desk, 0, 0, $SRCCOPY)

While GUIGetMsg() <> -3
	Sleep(10)
WEnd

_WinAPI_ReleaseDC($hGui, $hDC_Gui)
_WinAPI_ReleaseDC($hWnd, $hDC_Desk)