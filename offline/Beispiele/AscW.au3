#include <MsgBoxConstants.au3>

Local $iCode = AscW("ß")
MsgBox($MB_SYSTEMMODAL, "", "Unicode Code für ß: U+" & Hex($iCode, 6))
