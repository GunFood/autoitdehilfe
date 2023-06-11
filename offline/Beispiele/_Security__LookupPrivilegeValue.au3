#include <Security.au3>
#include <SecurityConstants.au3>

Local $vLUID = _Security__LookupPrivilegeValue("", $SE_DEBUG_NAME)
; $vLUID repräsentiert LUID für einen Zugriffswert in Form eines 64Bit Integers.
; Ausgabe (aus Neugier):
ConsoleWrite("$vLUID = " & $vLUID & @CRLF)
; ... Der Rest des Skripts hier hinein ...
