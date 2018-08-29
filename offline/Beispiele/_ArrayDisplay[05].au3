#include <Array.au3>

Local $asControls = StringSplit(WinGetClassList("[active]", ""), @LF)
_ArrayDisplay($asControls, "Klassenliste des aktiven Fensters")

