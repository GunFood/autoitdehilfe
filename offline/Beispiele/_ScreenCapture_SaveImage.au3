#include <ScreenCapture.au3>

Example()

Func Example()
	Local $hBmp

	; Erstellt einen Screenshot vom kompletten Bildschirm
	$hBmp = _ScreenCapture_Capture("")

	; Speichert das Bitmap in eine Datei
	_ScreenCapture_SaveImage(@MyDocumentsDir & "\GDIPlus_Image.jpg", $hBmp)

	ShellExecute(@MyDocumentsDir & "\GDIPlus_Image.jpg")
EndFunc   ;==>Example
