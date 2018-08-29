#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iValue = 0
	Local $sBlank = "Test"

	Select
		Case $iValue = 1
			MsgBox($MB_SYSTEMMODAL, "", "Der erste Case-Ausdruck ist wahr")
		Case $sBlank = "Test"
			MsgBox($MB_SYSTEMMODAL, "", "Der zweite Case-Ausdruck ist wahr")
		Case Else ; Wenn nichts passt wird das folgende ausgeführt
			MsgBox($MB_SYSTEMMODAL, "", "Kein vorheriger Case-Ausdruck war wahr!")
	EndSelect
EndFunc   ;==>Example
