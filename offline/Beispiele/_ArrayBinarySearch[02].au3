;verwendet ein Array, welches durch StringSplit() zurückgegeben wurde

#include <Array.au3>
#include <MsgBoxConstants.au3>

Local $avArray = StringSplit("a,b,d,c,e,f,g,h,i", ",")

; Sortiert das Array so, dass eine binäre Suche möglich ist
_ArraySort($avArray, 0, 1) ; Startet bei Index 1, um $avArray[0] zu umgehen

; Zeigt das sortierte Array
_ArrayDisplay($avArray, "$avArray NACH _ArraySort()")

; Startet bei Index 1, um $avArray[0] zu umgehen
Local $iKeyIndex = _ArrayBinarySearch($avArray, "c", 1)
If Not @error Then
	MsgBox($MB_SYSTEMMODAL, 'Eintrag wurde gefunden', ' Index: ' & $iKeyIndex)
Else
	MsgBox($MB_SYSTEMMODAL, 'Eintrag wurde nicht gefunden', ' Fehler: ' & @error)
EndIf
