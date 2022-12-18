; Option 3, globale Rückgabe, alter AutoIt-Stil

#include <Array.au3>
#include <StringConstants.au3>

Local $aArray = StringRegExp('<test>a</test> <test>b</test> <test>c</Test>', '(?i)<test>(.*?)</test>', $STR_REGEXPARRAYGLOBALMATCH)
#cs
	1. Capturing Gruppe (.*?)
	. Findet jedes einzelne Zeichen außer, standardmäßig, eines Zeilenumbruchs
	*? findet Zeichen zwischen null und unbegrenzt oft, aber so wenig wie möglich, Erweiterung nach Bedarf (träge)
#ce
_ArrayDisplay($aArray, "Option 3 Ergebnisse")
