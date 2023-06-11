#include <MsgBoxConstants.au3>

; Wartet bis sich im Bereich 0,0 bis 50,50 was verändert

; Startwert der zu prüfenden Checksumme ermitteln
Local $iCheckSum = PixelChecksum(0, 0, 50, 50)

; Wartet, bis sich die Region verändert. Die Region wird alle 100ms überprüft, um die CPU-Last niedrig zu halten.
While $iCheckSum = PixelChecksum(0, 0, 50, 50)
	Sleep(100)
WEnd

MsgBox($MB_SYSTEMMODAL, "", "In der Region trat eine Änderung auf!")
