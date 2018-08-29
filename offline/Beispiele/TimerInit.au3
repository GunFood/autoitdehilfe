#include <MsgBoxConstants.au3>

Local $hTimer = TimerInit() ; Beginnt den Timer speichert das Handle in einer Variable.
Sleep(3000) ; Sleep für 3 Sekunden.
Local $fDiff = TimerDiff($hTimer) ; Findet den Zeitunterschied zum vorherigen Aufruf von TimerInit. Die Variable wird im TimerInit Handle gespeichert und als Handle an TimerDiff übergeben.
MsgBox($MB_SYSTEMMODAL, "Zeitunterschied", $fDiff)
