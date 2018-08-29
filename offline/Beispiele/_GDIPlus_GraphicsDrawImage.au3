#include <GDIPlus.au3>
#include <ScreenCapture.au3>
#include <WinAPIHObj.au3>

Example()

Func Example()
	Local $hBitmap1, $hBitmap2, $hImage1, $hImage2, $hGraphic

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; Erstellt vom kompletten Bildschirm einen Screenshot
	$hBitmap1 = _ScreenCapture_Capture("")
	$hImage1 = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap1)

	; Erstellt von einem Bereich einen Screenshot
	$hBitmap2 = _ScreenCapture_Capture("", 0, 0, 400, 300)
	$hImage2 = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap2)

	; Zeichnet ein Bild in ein anderes
	$hGraphic = _GDIPlus_ImageGetGraphicsContext($hImage1)
	_GDIPlus_GraphicsDrawImage($hGraphic, $hImage2, 100, 100)

	; Zeichnet einen Rahmen um das eingefügte Bild
	_GDIPlus_GraphicsDrawRect($hGraphic, 100, 100, 400, 300)

	; Speichert das neue Bild
	_GDIPlus_ImageSaveToFile($hImage1, @MyDocumentsDir & "\GDIPlus_Image.jpg")

	; Ressourcen freigeben
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_WinAPI_DeleteObject($hBitmap1)
	_WinAPI_DeleteObject($hBitmap2)

	; Gibt die durch Microsoft Windows GDI+ verwendeten Ressourcen wieder frei
	_GDIPlus_Shutdown()

	ShellExecute(@MyDocumentsDir & "\GDIPlus_Image.jpg")
EndFunc   ;==>Example
