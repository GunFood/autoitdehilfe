#include <WinAPISys.au3>

; Ermittelt das Handle des geladenen Moduls
Local $hModule = _WinAPI_GetModuleHandle("kernel32.dll")

If $hModule Then
	Local $pFunction = _WinAPI_GetProcAddress($hModule, "CreateFiber")
	ConsoleWrite("Die Adresse der Funktion lautet " & $pFunction & @CRLF)

	; Macht irgendwas

EndIf
