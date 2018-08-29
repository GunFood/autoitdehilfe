#include <MsgBoxConstants.au3>

; Findet ein rotes Pixel im Rechteck 0,0-200,300.
Local $aCoord = PixelSearch(0, 0, 200, 300, 0xFF0000)
If Not @error Then
	MsgBox($MB_SYSTEMMODAL, "Die Koordinaten X und Y lauten:", $aCoord[0] & "," & $aCoord[1])
EndIf


; Findet ein rotes Pixel oder ein Pixel mit 100 Abstufungen (Variationen) von reinem Rot.
$aCoord = PixelSearch(0, 0, 200, 300, 0xFF0000, 100)
If Not @error Then
	MsgBox($MB_SYSTEMMODAL, "Die Koordinaten X und Y lauten:", $aCoord[0] & "," & $aCoord[1])
EndIf
