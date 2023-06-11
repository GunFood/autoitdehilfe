#include <MsgBoxConstants.au3>
#include <WinAPISysWin.au3>

Example()

Func Example()
	Local $aWindows, $i, $sText
	$aWindows = _WinAPI_EnumWindowsTop()
	For $i = 1 To $aWindows[0][0]
		$sText = "Fenster-Handle: " & $aWindows[$i][0] & @CRLF
		$sText &= "Fensterklasse: " & $aWindows[$i][1] & @CRLF
		$sText &= "Fenstertitel: " & WinGetTitle($aWindows[$i][0]) & @CRLF
		$sText &= "Fenstertext: " & WinGetText($aWindows[$i][0]) & @CRLF
		$sText &= "Fensterprozess: " & WinGetProcess($aWindows[$i][0])
		MsgBox($MB_SYSTEMMODAL, "Item " & $i & " of " & $aWindows[0][0], $sText)
	Next
EndFunc   ;==>Example
