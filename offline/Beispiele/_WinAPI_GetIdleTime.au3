#include <WinAPISys.au3>

For $i = 1 To 5
	ConsoleWrite('Leerlaufzeit (ms): ' & _WinAPI_GetIdleTime() & @CRLF)
	Sleep(1000)
Next
