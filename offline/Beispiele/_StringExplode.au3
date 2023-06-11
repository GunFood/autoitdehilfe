#include <Array.au3>
#include <String.au3>

Local $sText = "eins##zwei##drei##vier##fünf##sechs##sieben##acht"
Local $aArray1 = _StringExplode($sText, "##", 0)
_ArrayDisplay($aArray1, "StringExplode 0")

; ANZEIGE:
;[0] = eins
;[1] = zwei
;[2] = drei
;[3] = vier
;[4] = fünf
;[5] = sechs
;[6] = sieben
;[7] = acht

Local $aArray2 = _StringExplode($sText, "##", 4)
_ArrayDisplay($aArray2, "StringExplode 4")

; ANZEIGE:
;[0] = eins
;[1] = zwei
;[2] = drei
;[3] = vier
;[4] = fünf##sechs##sieben##acht

Local $aArray3 = _StringExplode($sText, "##", -3)
_ArrayDisplay($aArray3, "StringExplode -3")

; ANZEIGE:
;[0] = eins
;[1] = zwei
;[2] = drei
;[3] = vier
;[4] = fünf
