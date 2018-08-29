#include <MsgBoxConstants.au3>

; Weist der Variablen sString Daten zu
Assign("sString", "Dies ist ein String welcher mit der Funktion Assign deklariert wurde")

; Gibt den Wert der Variablen sString zurück und weist diesen der Variable $sEvalString zu.
Local $sEvalString = Eval("sString")

; Zeigt den Wert von $sEvalString. Dies sollte der gleiche Wert wie $sString sein.
MsgBox($MB_SYSTEMMODAL, "", $sEvalString)
