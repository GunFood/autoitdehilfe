#include <WinAPI.au3>

For $i = 0 To 5
	_WinAPI_MessageBeep($i)
	Sleep(500)
Next