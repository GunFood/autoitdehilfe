#include <WinAPI.au3>

$hGui = GUICreate("GUI", 200, 300)
GUISetState()
$hoehe = _WinAPI_GetWindowHeight($hGui)
ConsoleWrite($hoehe & @CRLF)