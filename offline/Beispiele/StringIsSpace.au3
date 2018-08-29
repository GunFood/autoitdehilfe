#include <MsgBoxConstants.au3>

Local $sString = "   " & @CRLF & @CRLF & Chr(11) & @TAB & " " & @CRLF ; Prüft, ob der String nur Leerzeichen enthält.
If StringIsSpace($sString) Then
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable enthält nur Leerzeichen.")
Else
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable enthält nicht nur Leerzeichen.")
EndIf
