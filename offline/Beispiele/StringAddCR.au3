#include <MsgBoxConstants.au3>

; Setzt allen Zeilenwechsel-Zeichen ( Chr(10) ) ein Eingabe-Zeichen ( Chr(13) ) voran.
Local $sString = StringAddCR("Dies ist ein Satz " & @LF & "mit " & Chr(10) & "Leerzeichen.")
MsgBox($MB_SYSTEMMODAL, "", $sString)
