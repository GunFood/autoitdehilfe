#include <MsgBoxConstants.au3>

Local $iLife = 42
If IsNumber($iLife) Then
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist eine Zahl")
Else
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist keine Zahl")
EndIf
