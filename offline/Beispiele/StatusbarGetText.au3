#include <MsgBoxConstants.au3>

AutoItSetOption("WinTitleMatchMode", 2)

Local $sText = StatusbarGetText("Internet Explorer")
MsgBox($MB_SYSTEMMODAL, "Die Statusbar des Internet Explorer beinhaltet:", $sText)
