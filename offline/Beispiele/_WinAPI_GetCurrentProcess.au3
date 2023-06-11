#include <WinAPI.au3>

Local $hCurProcessPseudo = _WinAPI_GetCurrentProcess()
ConsoleWrite("Pseudo Handle f�r aktuellen Prozess = " & $hCurProcessPseudo & @CRLF)

Local $hCurProcess = _WinAPI_DuplicateHandle($hCurProcessPseudo, $hCurProcessPseudo, $hCurProcessPseudo, Default, True, $DUPLICATE_SAME_ACCESS)
ConsoleWrite("Richtiges Handle f�r aktuellen Prozess = " & $hCurProcess & @CRLF)

;...

; Handle nach Gebrauch schlie�en
_WinAPI_CloseHandle($hCurProcess)

