#include <Date.au3>
#include <MsgBoxConstants.au3>

If _DateIsLeapYear(@YEAR) Then
	MsgBox($MB_SYSTEMMODAL, "Schaltjahr", "Das Jahr ist ein Schaltjahr.")
Else
	MsgBox($MB_SYSTEMMODAL, "Schaltjahr", "Das Jahr ist kein Schaltjahr.")
EndIf
