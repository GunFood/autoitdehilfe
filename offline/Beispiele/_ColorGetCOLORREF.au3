#include <Color.au3>
#include <MsgBoxConstants.au3>

Local $iColor = 0x8090FF

Local $aColor = _ColorGetCOLORREF($nColor)
MsgBox($MB_SYSTEMMODAL, "AutoIt", "Farbe=" & Hex($nColor) & @CRLF & " Rot=" & Hex($aColor[0], 2) & " Blau=" & Hex($aColor[1], 2) & " Grün=" & Hex($aColor[2], 2))
