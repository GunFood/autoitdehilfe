#include <MsgBoxConstants.au3>

Local $sString = "Dies ist ein String"
If IsString($sString) Then
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist ein String")
Else
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist kein String")
EndIf
