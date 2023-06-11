#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <ScreenCapture.au3>
#include <WinAPIHObj.au3>

Example()

Func Example()
	Local $hBitmap, $hImage, $hGraphic

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; Erstellt von einem Bereich einen Screenshot
	$hBitmap = _ScreenCapture_Capture("", 0, 0, 400, 300)
	$hImage = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap)

	; Färbt ein Grafik-Objekt in einem vollfarbigen Schwarz
	$hGraphic = _GDIPlus_ImageGetGraphicsContext($hImage)
	_GDIPlus_GraphicsClear($hGraphic)

	; Speichert das neue Bild
	_GDIPlus_ImageSaveToFile($hImage, @MyDocumentsDir & "\GDIPlus_Image.jpg")

	; Ressourcen freigeben
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_ImageDispose($hImage)
	_WinAPI_DeleteObject($hBitmap)

	; Gibt die durch Microsoft Windows GDI+ verwendeten Ressourcen wieder frei
	_GDIPlus_Shutdown()

	ShellExecute(@MyDocumentsDir & "\GDIPlus_Image.jpg")
EndFunc   ;==>Example
