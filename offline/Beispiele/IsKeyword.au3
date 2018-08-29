#include <Constants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Prüft, ob die Variable ein Schlüsselwort ist.
	Local $vDefault = Default
	If IsDefault($vDefault) Then
		MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist ein Schlüsselwort")
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist kein Schlüsselwort")
	EndIf

	; Prüft, ob die Variable das Null Schlüsselwort ist.
	Local $vNull = Null
	If IsNull($vNull) Then
		MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist das Null Schlüsselwort")
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist nicht das Null Schlüsselwort")
	EndIf

	; Prüft, ob die Variable das Null Schlüsselwort ist. Dies ist falsch, wenn $sString ein StringDatentyp ist.
	Local $sString = 'Default'
	If IsDefault($sString) Then
		MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist das Default Schlüsselwort")
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist das Default Schlüsselwort")
	EndIf
EndFunc   ;==>Example

Func IsDefault($vKeyword)
	Return IsKeyword($vKeyword) = $KEYWORD_DEFAULT
EndFunc   ;==>IsDefault

Func IsNull($vKeyword)
	Return IsKeyword($vKeyword) = $KEYWORD_NULL
EndFunc   ;==>IsNull
