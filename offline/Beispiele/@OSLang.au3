#include <MsgBoxConstants.au3>

MsgBox($MB_SYSTEMMODAL, "", "Die Sprache des Betriebssystems lautet: " & _GetLanguage() & " (" & LCIDToLocaleName("0x" & @OSLang) & ")")

; Ruft die Sprache des Betriebssystems ab.
Func _GetLanguage()
	; @OSLang ist vier Zeichen lang, die ersten beiden sind der Dialekt und die restlichen zwei sind die Sprachgruppe.
	; Da wir nur die Sprachgruppe benötigen, wählen wir die beiden Zeichen ganz rechts aus.
	Switch StringRight(@OSLang, 2)
		Case "07"
			Return "Deutsch"
		Case "09"
			Return "Englisch"
		Case "0a"
			Return "Spanisch"
		Case "0b"
			Return "Finnisch"
		Case "0c"
			Return "Französisch"
		Case "10"
			Return "Italienisch"
		Case "13"
			Return "Niederländisch"
		Case "14"
			Return "Norwegisch"
		Case "15"
			Return "Polnisch"
		Case "16"
			Return "Portugiesisch"
		Case "1d"
			Return "Schwedisch"

		Case Else
			Return "Andere (kann nicht direkt durch @OSLang ermittelt werden)"

	EndSwitch
EndFunc   ;==>_GetLanguage

Func LCIDToLocaleName($iLCID)
	Local $aRet = DllCall("kernel32.dll", "int", "LCIDToLocaleName", "int", $iLCID, "wstr", "", "int", 85, "dword", 0)
	Return $aRet[2]
EndFunc   ;==>LCIDToLocaleName
