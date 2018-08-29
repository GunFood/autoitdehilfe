#include <Misc.au3>
#include <MsgBoxConstants.au3>

Local $a_vFont = _ChooseFont("Arial", 8)
If (@error) Then
	MsgBox($MB_SYSTEMMODAL, "", "_ChooseFont-Fehler: " & @error)
Else
	MsgBox($MB_SYSTEMMODAL, "", "Schriftname: " & $a_vFont[2] & @CRLF & "Größe: " & $a_vFont[3] & @CRLF & "Gewicht: " & $a_vFont[4] & @CRLF & "COLORREF-rgb-Farben: " & $a_vFont[5] & @CRLF & "Hex BGR-Farbe: " & $a_vFont[6] & @CRLF & "Hex RGB-Farbe: " & $a_vFont[7])
EndIf

