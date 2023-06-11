#include <MsgBoxConstants.au3>

Local $oShell = ObjCreate("shell.application")
If IsObj($oShell) Then
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist ein Objekt.")
Else
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist kein Objekt.")
EndIf
