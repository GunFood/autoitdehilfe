#include <Array.au3>

Local $aArray[3][2] = [[1, 2], [3, 4], [5, 6]]
_ArrayDisplay($aArray, "Original")
_ArrayTranspose($aArray)
_ArrayDisplay($aArray, "Vertauscht")

Local $aArray[5] = [1, 2, 3, 4, 5]
_ArrayDisplay($aArray, "Original 1D")
_ArrayTranspose($aArray)
_ArrayDisplay($aArray, "Vertauscht zu 2D")
_ArrayTranspose($aArray, Default)
_ArrayDisplay($aArray, "Zurückvertauscht, aber immer noch 2D")

Local $aArray[5] = [1, 2, 3, 4, 5]
_ArrayDisplay($aArray, "Original 1D")
_ArrayTranspose($aArray)
_ArrayDisplay($aArray, "Vertauscht zu 2D")
_ArrayTranspose($aArray, True)
_ArrayDisplay($aArray, "Erzwungenermaßen zurückvertauscht in 1D")
