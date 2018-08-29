#include <Array.au3>
#include <Constants.au3>

; ----------------- Rückgabeformen
; Hier ein kleines Script, nur um die verschiedenen Rückgabeformen zu verdeutlichen:
$sString = _
		'<td><img src="img/x.gif" class="r1" alt="Holz" title="Holz"></td>' & @CRLF & _
		'<td id="l4" title="600">132411/240000</td>' & @CRLF & _
		'<td><img src="img/x.gif" class="r2" alt="Lehm" title="Lehm"></td>' & @CRLF & _
		'<td id="l3" title="600">168007/240000</td>' & @CRLF & _
		'<td><img src="img/x.gif" class="r3" alt="Eisen" title="Eisen"></td>' & @CRLF & _
		'<td id="l2" title="750">32743/240000</td>' & @CRLF & _
		'<td><img src="img/x.gif" class="r4" alt="Getreide" title="Getreide"></td>' & @CRLF & _
		'<td id="l1" title="79">78451/240000</td>'

$aFlag1 = StringRegExp($sString, "l[1-4][^>]+>(\d+\/\d+)", 1)
$aFlag2 = StringRegExp($sString, "l[1-4][^>]+>(\d+\/\d+)", 2)
$aFlag3 = StringRegExp($sString, "l[1-4][^>]+>(\d+\/\d+)", 3)
$aFlag4 = StringRegExp($sString, "l[1-4][^>]+>(\d+\/\d+)", 4)

MsgBox($MB_OK, "", "Flag 0 gibt 1 (matched) oder 0 (no match) zurück.")
MsgBox($MB_OK, "Flag 0", StringRegExp($sString, "l[1-4][^>]+>(\d+\/\d+)"))

MsgBox($MB_OK, "", "Flag 1 zeigt das erste Match (nur Subpatterns)")
_ArrayDisplay($aFlag1, "Flag 1")

MsgBox($MB_OK, "", "Flag 2 zeigt das erste Match (Full Match + Subpatterns)")
_ArrayDisplay($aFlag2, "Flag 2")

MsgBox($MB_OK, "", "Flag 3 zeigt alle Matches (nur Subpatterns)")
_ArrayDisplay($aFlag3, "Flag 3")

MsgBox($MB_OK, "", "Flag 4 gibt einen Array voller Arrays zurück.")
_ArrayDisplay($aFlag4, "Flag 4")
MsgBox($MB_OK, "", "Die einzelnen Arrays beinhalten Full Match + Subpatterns." & @CRLF & _
		"Leider kann man Arrays in Arrays nicht direkt ansprechen" & @CRLF & _
		"(ohne sie zwischenzuspeichern), deswegen benutze ich statt Flag 4 immer Flag 3." & @CRLF & _
		"Hier mal alle Arrays in $aFlag4:")

For $i = 0 To UBound($aFlag4) - 1
	$aDummy = $aFlag4[$i]
	_ArrayDisplay($aDummy, "$aFlag4[" & $i & "]")
Next



