#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <ScreenCapture.au3>
#include <WinAPIHObj.au3>

Example()

Func Example()
	Local $hBMP, $hImage, $iX, $iY, $hClone

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; Erstellt vom kompletten Bildschirm einen Screenshot und erzeugt daraus eine 32 Bit Bitmap
	$hBMP = _ScreenCapture_Capture("")
	$hImage = _GDIPlus_BitmapCreateFromHBITMAP($hBMP)

	; Erzeugt eine Kopie einer 24 Bit Bitmap
	$iX = _GDIPlus_ImageGetWidth($hImage)
	$iY = _GDIPlus_ImageGetHeight($hImage)
	$hClone = _GDIPlus_BitmapCloneArea($hImage, 0, 0, $iX, $iY, $GDIP_PXF24RGB)

	; Speichert das Bild in eine Datei
	_GDIPlus_ImageSaveToFile($hClone, @TempDir & "\GDIPlus_Image.bmp")

	; Ressourcen freigeben
	_GDIPlus_BitmapDispose($hClone)
	_GDIPlus_BitmapDispose($hImage)
	_WinAPI_DeleteObject($hBMP)

	; Lädt ein Bild
	$hImage = _GDIPlus_ImageLoadFromFile(@TempDir & "\GDIPlus_Image.bmp")
	$hBMP = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hImage)

	; Speichert das Bild in eine Datei
	_ScreenCapture_SaveImage(@TempDir & "\Image.bmp", $hBMP, True) ; True -> $hBMP zerstört

	; Ressourcen freigeben
	_GDIPlus_ImageDispose($hImage)

	; Gibt die durch Microsoft Windows GDI+ verwendeten Ressourcen wieder frei
	_GDIPlus_Shutdown()
EndFunc   ;==>Example
