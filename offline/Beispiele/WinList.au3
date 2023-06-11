#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Ermittelt eine Liste mit Fensterhandles.
	Local $aList = WinList()

	; Durchläuft das Array und zeigt nur die Titel der sichtbaren Fenster.
	For $i = 1 To $aList[0][0]
		If $aList[$i][0] <> "" And BitAND(WinGetState($aList[$i][1]), 2) Then
			MsgBox($MB_SYSTEMMODAL, "", "Titel: " & $aList[$i][0] & @CRLF & "Handle: " & $aList[$i][1])
		EndIf
	Next
EndFunc   ;==>Example
