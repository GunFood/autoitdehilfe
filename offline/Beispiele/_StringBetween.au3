#include <Array.au3>
#include <String.au3>

Example()

Func Example()
	; Erstellt ein Array mit allen Werten zwischen "[" und "]"
	Local $aArray = _StringBetween('[18][20][3][5][500][60]', '[', ']')

	; Zeigt das Ergebnis mit _ArrayDisplay
	_ArrayDisplay($aArray, 'Standardsuche')

	; Erstellt ein Arraay mit allen Werten zwischen "|" und "|". Es ist zu beachten, dass $sStart und $sEnd identisch sind.
	Local $sString = "-----|Both Modes|$STR_ENDISSTART only|Both Modes|-----"

	; Modus $STR_ENDISSTART - Standard
	$aArray = _StringBetween($sString, "|", "|")
	; Zeigt die Ergebnisse in _ArrayDisplay.
	_ArrayDisplay($aArray, "$STR_ENDISSTART")

	; Modus $STR_ENDNOTSTART
	$aArray = _StringBetween($sString, "|", "|", $STR_ENDNOTSTART)
	; Zeigt die Ergebnisse in _ArrayDisplay.
	_ArrayDisplay($aArray, "$STR_ENDNOTSTART")
EndFunc   ;==>Example
