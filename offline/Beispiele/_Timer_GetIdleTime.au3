#include <MsgBoxConstants.au3>
#include <Timers.au3>

; Maus- oder Tastaturaktionen während dieser 10 Sekunden beeinflussen die berichtete Leerlaufzeit
Sleep(10 * 1000) ; 10sec

Local $iIdleTime = _Timer_GetIdleTime()

MsgBox($MB_SYSTEMMODAL, "_Timer_GetIdleTime", "Leerlaufzeit = " & $iIdleTime & "ms")
