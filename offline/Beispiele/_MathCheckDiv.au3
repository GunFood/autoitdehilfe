#include <Math.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iVar = Int(InputBox('ungerade oder gerade', 'Eine Zahl eingeben:')) ; Analyse als Integer
	Local $iResult = _MathCheckDiv($iVar, 2) ; Die Zahl wird durch 2 geteilt.
	If @error Then
		MsgBox($MB_SYSTEMMODAL, "", "Es wurde keine gültige Zahl eingegeben")
	Else
		Switch $iResult
			Case -1
				MsgBox($MB_SYSTEMMODAL, '', 'Es wurde eine ungültige Zahl eingegeben')
			Case $MATH_ISNOTDIVISIBLE
				MsgBox($MB_SYSTEMMODAL, '', 'Zahl ist ungerade')
			Case $MATH_ISDIVISIBLE
				MsgBox($MB_SYSTEMMODAL, '', 'Zahl ist gerade')
			Case Else
				MsgBox($MB_SYSTEMMODAL, '', 'Die Zahl konnte nicht analysiert werden')
		EndSwitch
	EndIf
EndFunc   ;==>Example
