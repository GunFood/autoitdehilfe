;Deklariert ein 1D Array und gibt ein Array mit allen möglichen Kombinationen zurück

#include <Array.au3>

Local $aArray[4] = [1, 2, 3, 4]
Local $aNewArray = _ArrayPermute($aArray, ",") ; Standardparameter verwenden
_ArrayDisplay($aNewArray, "Array mit allen möglichen Kombinationen")
