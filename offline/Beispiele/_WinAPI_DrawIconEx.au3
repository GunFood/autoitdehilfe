#include <Constants.au3>
#include <WinAPI.au3>

$hGui = GUICreate("_WinAPI_Icon", 450, 120)
GUISetState()
$hDC = _WinAPI_GetDC($hGui)

$hInstance = _WinAPI_GetModuleHandle("shell32.dll")
$hIcon1 = _WinAPI_LoadImage($hInstance, 1, $IMAGE_ICON, 0, 0, $LR_DEFAULTSIZE)
$hIcon2 = _WinAPI_LoadImage($hInstance, 2, $IMAGE_ICON, 0, 0, $LR_DEFAULTSIZE)
$hIcon3 = _WinAPI_CopyIcon($hIcon2)
;$hIcon4 = _WinAPI_PrivateExtractIcon("shell32.dll", 4, 96, 96) ; ab der nächsten Beta
$hIcon5 = _WinAPI_LoadShell32Icon(5)

_WinAPI_DrawIcon($hDC, 10, 10, $hIcon1)
_WinAPI_DrawIconEx($hDC, 70, 10, $hIcon2, 100, 50)
_WinAPI_DrawIcon($hDC, 200, 10, $hIcon3)
;_WinAPI_DrawIconEx($hDC, 300, 10, $hIcon4, 96, 96)
_WinAPI_DrawIcon($hDC, 400, 10, $hIcon5)

While GUIGetMsg() <> -3
    Sleep(10)
WEnd

_WinAPI_DestroyIcon($hIcon1)
_WinAPI_DestroyIcon($hIcon2)
_WinAPI_DestroyIcon($hIcon3)
;_WinAPI_DestroyIcon($hIcon4)
_WinAPI_DestroyIcon($hIcon5)
_WinAPI_ReleaseDC($hGui, $hDC)
