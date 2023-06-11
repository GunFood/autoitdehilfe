#include <MsgBoxConstants.au3>

Test1()
Test2()
Test3()

; Dieses Beispiel zeigt grundlegendes Ersetzen. Es ersetzt die Vokale aeiou
; durch das @ Zeichen.
Func Test1()
	Local $sInput = "Wo sind all die Blumen hin, wo sind sie geblieben?"
	Local $sOutput = StringRegExpReplace($sInput, "[aeiou]", "@")
	Display($sInput, $sOutput)
EndFunc   ;==>Test1

; Das folgende Beispiel zeigt Rückverweise um das Datum
; von MM/DD/YYYY auf DD.MM.YYYY zu ändern
Func Test2()
	Local $sInput = 'etwas Text1 12/31/2009 01:02:03 etwas Text2' & @CRLF & _
			'etwas Text3 02/28/2009 11:22:33 etwas Text4'
	Local $sOutput = StringRegExpReplace($sInput, '(\d{2})/(\d{2})/(\d{4})', ' $2.$1.$3 ')
	Display($sInput, $sOutput)
EndFunc   ;==>Test2

; Das folgende Beispiel zeigt, wann doppelte Backslash benötigt werden
Func Test3()
	Local $sInput = '%CommonProgramFiles%\Microsoft Shared\'
	Local $sOutput = StringRegExpReplace($sInput, '%([^%]*?)%', 'C:\\WINDOWS\\Some Other Folder$')
	Display($sInput, $sOutput)
EndFunc   ;==>Test3


Func Display($sInput, $sOutput)
	; Die Ausgabe formatieren.
	Local $sMsg = StringFormat("Eingabe:\t%s\n\nAusgabe:\t%s", $sInput, $sOutput)
	MsgBox($MB_SYSTEMMODAL, "Ergebnis", $sMsg)
EndFunc   ;==>Display
