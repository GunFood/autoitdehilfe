#include <MsgBoxConstants.au3>

Example()

Func Example()
	; ein Array verwenden
	Local $aArray[4]

	$aArray[0] = "a"
	$aArray[1] = 0
	$aArray[2] = 1.3434
	$aArray[3] = "test"

	Local $sString = ""
	For $vElement In $aArray
		$sString = $sString & $vElement & @CRLF
	Next

	MsgBox($MB_SYSTEMMODAL, "", "For..IN Arraytest:" & @CRLF & "Das Ergebnis lautet: " & @CRLF & $sString)

	; Verwendung eines Objektes

	Local $oShell = ObjCreate("shell.application")
	Local $oShellWindows = $oShell.windows

	If IsObj($oShellWindows) Then
		$sString = ""

		For $Window In $oShellWindows
			$sString = $sString & $Window.LocationName & @CRLF
		Next

		MsgBox($MB_SYSTEMMODAL, "", "Es gibt folgende geöffnete Fenster:" & @CRLF & $sString)
	Else

		MsgBox($MB_SYSTEMMODAL, "", "Es gibt keine geöffneten Fenster.")
	EndIf
EndFunc   ;==>Example
