#include <Array.au3>
#include <Debug.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aArrayFromText = _ArrayFromString("  1|2  ") ;               standardmäßig, FÜHREND und NACHFOLGEND
	_DebugArrayDisplay($aArrayFromText, UBound($aArrayFromText, $UBOUND_DIMENSIONS) & "D") ; Leerzeichen werden entfernt.

	$aArrayFromText = _ArrayFromString("1|2", Default, Default, True) ; erzwingt ein 2D-Array
	_DebugArrayDisplay($aArrayFromText, UBound($aArrayFromText, $UBOUND_DIMENSIONS) & "D")

	$aArrayFromText = _ArrayFromString("1|2" & @CRLF & "3|4")
	_DebugArrayDisplay($aArrayFromText, UBound($aArrayFromText, $UBOUND_DIMENSIONS) & "D")

EndFunc   ;==>Example
