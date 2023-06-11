#include <IE.au3>
#include <MsgBoxConstants.au3>

;Abfrage des momentanen Timeouts

Local $iCurrentTimeout = _IELoadWaitTimeout()
MsgBox($MB_SYSTEMMODAL, "_IELoadWaitTimeout", $iCurrentTimeout / 1000 & " sec")
