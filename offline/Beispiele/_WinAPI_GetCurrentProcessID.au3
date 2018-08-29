#include <MsgBoxConstants.au3>
#include <WinAPIProc.au3>

MsgBox($MB_SYSTEMMODAL, "ID", "Ermittelt den aktuellen Prozess: " & _WinAPI_GetCurrentProcessID())
