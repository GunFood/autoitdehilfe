#include <Color.au3>
#include <MsgBoxConstants.au3>

Local $nColor = 0x8090ff

Local $aColor = _ColorGetRGB($nColor)
MsgBox($MB_SYSTEMMODAL, "AutoIt", "Farbe=" & Hex($nColor) & @CRLF & " Rot=" & Hex($aColor[0], 2) & " Blau=" & Hex($aColor[1], 2) & " Grün=" & Hex($aColor[2], 2))
