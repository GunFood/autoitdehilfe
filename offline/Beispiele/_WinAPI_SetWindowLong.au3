#include <WindowsConstants.au3>
#include <Constants.au3>
#include <WinAPI.au3>

$hGui = GUICreate("_WinAPI_SetParent", 320, 240, Default, Default, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_CLIPCHILDREN))
GUISetState(@SW_SHOW, $hGui)

$hPid = Run(@SystemDir & '\notepad.exe', "", @SW_HIDE)
WinWait("[CLASS:Notepad]")
$hChild = WinGetHandle("[CLASS:Notepad]")

_WinAPI_SetParent($hChild, $hGui)
_WinAPI_SetWindowLong($hChild, $GWL_STYLE, BitOR($WS_CAPTION, $WS_POPUP))

WinSetState($hChild, "", @SW_SHOW)

While GUIGetMsg() <> -3
    Sleep(1)
WEnd
