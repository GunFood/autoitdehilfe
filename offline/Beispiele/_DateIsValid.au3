#include <Date.au3>
#include <MsgBoxConstants.au3>

Local $sDate = @YEAR & "/" & @MON & "/" & @MDAY

If _DateIsValid($sDate) Then
	MsgBox($MB_SYSTEMMODAL, "Gültiges Datum", "Das angegebene Datum ist gültig.")
Else
	MsgBox($MB_SYSTEMMODAL, "Gültiges Datum", "Das angegebene Datum ist ungültig.")
EndIf
