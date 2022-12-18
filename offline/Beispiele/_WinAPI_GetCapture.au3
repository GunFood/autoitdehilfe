#include <WinAPISys.au3>

Local $Hwnd = _WinAPI_GetCapture()
MsgBox(0, "Maus Capture Handle", $Hwnd)
