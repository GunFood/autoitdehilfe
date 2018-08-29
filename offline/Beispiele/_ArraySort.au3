#include <Array.au3>

;verwendet ein 1D Array

Local $avArray[10] = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]

_ArrayDisplay($avArray, "VOR _ArraySort()")
_ArraySort($avArray)
_ArrayDisplay($avArray, "NACHDEM aufsteigend sortiert hat")
_ArraySort($avArray, 1)
_ArrayDisplay($avArray, "NACHDEM absteigend sortiert hat")
_ArraySort($avArray, 0, 3, 6)
_ArrayDisplay($avArray, "NACHDEM von Index 3 bis 6 sortiert hat")
_ArraySort($avArray, 0, 0, 0, 0, 1)
_ArrayDisplay($avArray, "NACHDEM DualPivotSort aufsteigend sortiert hat")

