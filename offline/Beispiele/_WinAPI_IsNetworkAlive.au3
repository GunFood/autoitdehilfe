#include <WinAPIDiag.au3>

ConsoleWrite('Internet verbunden: ' & (_WinAPI_IsNetworkAlive() <> 0) & @CRLF)
