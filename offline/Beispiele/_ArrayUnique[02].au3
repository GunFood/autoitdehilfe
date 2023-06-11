; Deklariert ein 2D Array, welches doppelte Werte enthält.
; _ArrayUnique ist zu verwenden, um ein neues Array zu erstellen, welches jeden Wert maximal einmal enthält.

#include <Array.au3>

Local $aArray[6][2] = [[1, "A"], [2, "B"], [3, "C"], [1, "A"], [2, "B"], [3, "C"]]
_ArrayDisplay($aArray, "2D") ; zeigt das aktuelle Array
Local $aArrayUnique = _ArrayUnique($aArray) ; Standardparameter verwenden um ein Array der ersten Spalte zu erstellen
_ArrayDisplay($aArrayUnique, "$aNewArray zeigt die erste Dimension von $aArray") ; Zeigt das Array

$aArrayUnique = _ArrayUnique($aArray, 1) ; Erstellt ein Array aus der zweiten Spalte
_ArrayDisplay($aArrayUnique, "$aNewArray zeigt die zweite Dimension von $aArray") ; Zeigt das Array
