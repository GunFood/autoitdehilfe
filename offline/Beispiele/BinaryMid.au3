#include <MsgBoxConstants.au3>

Local $dBinary = Binary("0x10203040") ; Erstellt Binärdaten aus einem String
Local $dExtract = BinaryMid($dBinary, 2, 2)
MsgBox($MB_SYSTEMMODAL, "Das zweite und dritte Byte lautet: ", $dExtract)
