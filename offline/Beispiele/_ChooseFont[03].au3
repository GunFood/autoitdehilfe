#include <Misc.au3>
#include <MsgBoxConstants.au3>

Local $a_vFont = _ChooseFont()

Local $sFontName = $a_vFont[2]
Local $iFontSize = $a_vFont[3]
Local $iColorRef = $a_vFont[5]
Local $iFontWeight = $a_vFont[4]
Local $bItalic = BitAND($a_vFont[1], 2)
Local $bUnderline = BitAND($a_vFont[1], 4)
Local $bStrikethru = BitAND($a_vFont[1], 8)
$a_vFont = _ChooseFont($sFontName, $iFontSize, $iColorRef, $iFontWeight, $bItalic, $bUnderline, $bStrikethru)
If (@error) Then
	MsgBox($MB_SYSTEMMODAL, "", "_ChooseFont-Fehler: " & @error)
Else
	MsgBox($MB_SYSTEMMODAL, "", "Schriftname: " & $a_vFont[2] & @CRLF & "Größe: " & $a_vFont[3] & @CRLF & "Gewicht: " & $a_vFont[4] & @CRLF & "COLORREF-rgb-Farben: " & $a_vFont[5] & @CRLF & "Hex BGR-Farbe: " & $a_vFont[6] & @CRLF & "Hex RGB-Farbe: " & $a_vFont[7])
EndIf
