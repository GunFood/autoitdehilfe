#include <ScreenCapture.au3>

Example()

Func Example()
	; Erstellt einen Screenshot vom kompletten Bildschirm
	_ScreenCapture_SetBMPFormat(0) ; Setzt den Qualitätslevel, der für JPEG Screenshots verwendet wird
	_ScreenCapture_Capture(@MyDocumentsDir & "\GDIPlus_Image.bmp")

	ShellExecute(@MyDocumentsDir & "\GDIPlus_Image.bmp")
EndFunc   ;==>Example
