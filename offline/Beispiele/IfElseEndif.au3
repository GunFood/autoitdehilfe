#include <MsgBoxConstants.au3>

Local $sString = ""
If $sString > 0 Then
	MsgBox($MB_SYSTEMMODAL, "", "Der Wert ist positiv")
ElseIf $sString < 0 Then
	MsgBox($MB_SYSTEMMODAL, "", "Der Wert ist negativ")
Else
	If StringIsXDigit($sString) Then
		MsgBox($MB_SYSTEMMODAL, "", "Der Wert könnte hexadezimal sein!")
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Der Wert ist ein String ")
	EndIf
EndIf
