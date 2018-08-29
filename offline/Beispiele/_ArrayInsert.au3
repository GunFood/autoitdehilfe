#include <Array.au3>

Local $aArray_Base[10] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
_ArrayDisplay($aArray_Base, "1D - Original")

; Fügt ein einzelnes Item ein
Local $aArray = $aArray_Base
_ArrayInsert($aArray, 2, "Einfügen über 2")
_ArrayDisplay($aArray, "1D - Einzelnes Item")

; Fügt einen String mit einem Trennzeichen ein. Es wird als Bereich ein Array verwendet.
$aArray = $aArray_Base
Local $aRange[4] = [3, 3, 5, 9]
Local $sFill = "Einfügen über 3|Einfügen über 5|Einfügen über 9"
_ArrayInsert($aArray, $aRange, $sFill)
_ArrayDisplay($aArray, "1D - String mit einem Trennzeichen")

; Fügt ein 1D Array ein. Es wird als Bereich ein Array verwendet.
$aArray = $aArray_Base
Local $aFill[4] = ["Einfügen über 2", "Einfügen über 6.1", "Einfügen über 6.2", "Einfügen über 7"]
_ArrayInsert($aArray, "2;6;6;7", $aFill)
_ArrayDisplay($aArray, "1D - 1D Array")

; Fügt ein 1D Array ein. Es wird ein einzelnes Item verwendet.
$aArray = $aArray_Base
Local $aFill[4] = ["Einfügen 0", "Einfügen 1", "Einfügen 2", "Einfügen 3"]
_ArrayInsert($aArray, "2", $aFill, Default, Default, Default, $ARRAYFILL_FORCE_SINGLEITEM)
_ArrayDisplay($aArray, "1D - Einzelnes Item")
_ArrayDisplay(($aArray)[2], "Internes Array")
