#include <MsgBoxConstants.au3>

Local $mMap[] ; Eine Map deklarieren.
If IsMap($mMap) Then
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist eine Map")
Else
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist keine Map")
EndIf
