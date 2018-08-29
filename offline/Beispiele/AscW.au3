#include <MsgBoxConstants.au3>

Local $iCode = AscW("A")
MsgBox($MB_SYSTEMMODAL, "Unicode Code fürß: U+" & Hex($iCode, 6))
