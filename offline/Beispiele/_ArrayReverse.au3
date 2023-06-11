#include <Array.au3>

Local $avArray[10] = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]

_ArrayDisplay($avArray, "$avArray VOR _ArrayReverse()")
_ArrayReverse($avArray)
_ArrayDisplay($avArray, "$avArray NACH _ArrayReverse()")
_ArrayReverse($avArray, 3, 6)
_ArrayDisplay($avArray, "$avArray NACHDEM _ArrayReverse() auf den Index 3 bis 6 angewandt wurde")
