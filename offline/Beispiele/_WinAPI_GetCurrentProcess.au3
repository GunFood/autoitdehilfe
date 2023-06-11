#include <WinAPI.au3>

Local $hCurProcessPseudo = _WinAPI_GetCurrentProcess()
ConsoleWrite("Pseudo Handle für aktuellen Prozess = " & $hCurProcessPseudo & @CRLF)

Local $hCurProcess = _WinAPI_DuplicateHandle($hCurProcessPseudo, $hCurProcessPseudo, $hCurProcessPseudo, Default, True, $DUPLICATE_SAME_ACCESS)
ConsoleWrite("Richtiges Handle für aktuellen Prozess = " & $hCurProcess & @CRLF)

;...

; Handle nach Gebrauch schließen
_WinAPI_CloseHandle($hCurProcess)

