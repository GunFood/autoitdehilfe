#include <MsgBoxConstants.au3>

Local $i = 0
Do
	MsgBox($MB_SYSTEMMODAL, "Der Wert von $i lautet:", $i) ;Zeigt den Wert von $i an
	$i = $i + 1 ; $i +=1 kann auch verwendet werden
Until $i = 10 ;lässt den Wert von $i ansteigen bis er 10 entspricht
