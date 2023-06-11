#include <MsgBoxConstants.au3>
#include <WinAPIRes.au3>

Example()

Func Example()
	Local $aCursor, $sText
	$aCursor = _WinAPI_GetCursorInfo()
	$sText = "War der Vorgang erfolgreich? " & $aCursor[0] & @CRLF
	$sText &= "Wird der Cursor angezeigt? " & $aCursor[1] & @CRLF & @CRLF
	$sText &= "Cursor Handle: " & $aCursor[2] & @CRLF
	$sText &= "X-Koordinate: " & $aCursor[3] & @CRLF
	$sText &= "Y-Koordinate: " & $aCursor[4]
	MsgBox($MB_SYSTEMMODAL, "_WinApi_GetCursorInfo Demo", $sText)
EndFunc   ;==>Example
