#include <MsgBoxConstants.au3>

Local $sText = ""
For $i = 256 To 512
	$sText = $sText & ChrW($i) ; Oder $sText &= ChrW($i) kann genauso verwendet werden
Next
MsgBox($MB_SYSTEMMODAL, "Unicode Zeichen 256 bis 512", $sText) ;Zeigt die Unicode Zeichen zwischen 256 und 512
