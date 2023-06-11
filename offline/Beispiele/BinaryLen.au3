#include <MsgBoxConstants.au3>

Local $dBinary = Binary("0x10203040") ; Erstellt binäre Daten aus einem String
MsgBox($MB_SYSTEMMODAL, "Die Länge der binären Daten ist:", BinaryLen($dBinary))
