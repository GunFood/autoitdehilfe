#include <MsgBoxConstants.au3>

Local $bBoolean = True
If IsBool($bBoolean) Then
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist eine Bool'sche Variable")
Else
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist keine Bool'sche Variable")
EndIf
