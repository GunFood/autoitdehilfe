#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

Local $dNumber1 = Number(1 + 2 + 10) ; Gibt 13 zurück
Local $dNumber2 = Number("3.14") ; Gibt 3.14 zurück
Local $dNumber3 = Number("24/7") ; Gibt 24 zurück
Local $dNumber4 = Number("tmp3") ; Gibt 0 zurück
Local $dNumber5 = Number("1,000,000") ; Gibt 1 zurück, da alles inklusive und nach dem ersten Komma abgeschnitten wird.
Local $dNumber6 = Number("24autoit") ; Gibt 24 zurück
Local $dNumber7 = Number("1.2e3sa") ; Gibt 1200 zurück
Local $dNumber8 = Number("0xcade") ; Gibt 51934 zurück
Local $dNumber9 = Number(Ptr(5)) ; Gibt 5 zurück
Local $dNumber10 = Number(Binary("abc")) ; Gibt den Dezimalwert von 0x616263 zurück = 6513249
Local $dNumber11 = Number(ObjCreate("Scripting.Dictionary")) ; Gibt 0 zurück
Local $dNumber12 = Number(1 > 3 Or 5 <= 15) ; Gibt 1 zurück
Local $dNumber13 = Number("-30") ; Gibt 30 zurück

MsgBox($MB_SYSTEMMODAL, "", "Die folgenden Werte wurden in numerische Werte umgewandelt:" & @CRLF & _
		"$dNumber1 = " & $dNumber1 & @CRLF & _
		"$dNumber2 = " & $dNumber2 & @CRLF & _
		"$dNumber3 = " & $dNumber3 & @CRLF & _
		"$dNumber4 = " & $dNumber4 & @CRLF & _
		"$dNumber5 = " & $dNumber5 & @CRLF & _
		"$dNumber6 = " & $dNumber6 & @CRLF & _
		"$dNumber7 = " & $dNumber7 & @CRLF & _
		"$dNumber8 = " & $dNumber8 & @CRLF & _
		"$dNumber9 = " & $dNumber9 & @CRLF & _
		"$dNumber10 = " & $dNumber10 & @CRLF & _
		"$dNumber11 = " & $dNumber11 & @CRLF & _
		"$dNumber12 = " & $dNumber12 & @CRLF & _
		"$dNumber13 = " & $dNumber13 & @CRLF)
