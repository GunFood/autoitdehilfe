#include <WinAPISysWin.au3>

Local $tWINDOWINFO = _WinAPI_GetWindowInfo(_WinAPI_GetDesktopWindow())

ConsoleWrite('Links:   ' & DllStructGetData($tWINDOWINFO, 'rWindow', 1) & @CRLF)
ConsoleWrite('Oben:    ' & DllStructGetData($tWINDOWINFO, 'rWindow', 2) & @CRLF)
ConsoleWrite('Rechts:  ' & DllStructGetData($tWINDOWINFO, 'rWindow', 3) & @CRLF)
ConsoleWrite('Unten: ' & DllStructGetData($tWINDOWINFO, 'rWindow', 4) & @CRLF)
