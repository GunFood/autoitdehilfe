#include <IE.au3>
#include <MsgBoxConstants.au3>

; Setzen des Timeouts auf 1 Minute (60000 Millisekunden)

_IELoadWaitTimeout(60000)

Local $iCurrentTimeout = _IELoadWaitTimeout()
MsgBox($MB_SYSTEMMODAL, "_IELoadWaitTimeout", $iCurrentTimeout / 1000 & " sec")
