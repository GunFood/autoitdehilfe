#include <MsgBoxConstants.au3>

; Weist einer lokalen Variable die hexadezimale Zahl von 1033 zu.
Local $sHex1 = Hex(1033, 4)

; Zeigt das Ergebnis.
MsgBox($MB_SYSTEMMODAL, "", $sHex1)
