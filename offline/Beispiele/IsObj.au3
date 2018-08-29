#include <MsgBoxConstants.au3>

Local $oShell = ObjCreate("shell.application")
If IsObj($oShell) Then
	MsgBox($MB_SYSTEMMODAL, "", "Die Varaible ist ein Objekt.")
Else
	MsgBox($MB_SYSTEMMODAL, "", "Die Varaible ist kein Objekt.")
EndIf
