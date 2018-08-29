#include <MsgBoxConstants.au3>
#include <WinAPISysWin.au3>

MsgBox($MB_SYSTEMMODAL, "Handle", "Vordergrundfenster: " & _WinAPI_GetForegroundWindow())
