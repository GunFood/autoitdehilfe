#include <Color.au3>
#include <MsgBoxConstants.au3>

Local $aColor[3] = [0x80, 0x90, 0xff]

Local $nColor = _ColorSetCOLORREF($aColor)
MsgBox($MB_SYSTEMMODAL, "AutoIt", " Rot=" & Hex($aColor[0], 2) & " Grün=" & Hex($aColor[1], 2) & " Blau=" & Hex($aColor[2], 2) & @CRLF & _
		"ColorREF=" & Hex($nColor))
