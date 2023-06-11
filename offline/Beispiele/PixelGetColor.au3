#include <MsgBoxConstants.au3>

Local $iColor = PixelGetColor(10, 100)

MsgBox($MB_SYSTEMMODAL, "", "Der dezimale Wert der Farbe ist: " & $iColor)
MsgBox($MB_SYSTEMMODAL, "", "Der hexadezimale Wert der Farbe ist: " & Hex($iColor, 6))
