#include <Array.au3>

Local $aArray[4] = [0, 1, 2, 3]
_ArrayDisplay($aArray, "Original")

_ArrayColInsert($aArray, 0)
; Nun ein 2D Array
_ArrayDisplay($aArray, "Spalte 0 eingefügt")

_ArrayColInsert($aArray, 1)
_ArrayDisplay($aArray, "Spalte 1 eingefügt")

_ArrayColInsert($aArray, 3)
_ArrayDisplay($aArray, "Spalte 3 eingefügt")
