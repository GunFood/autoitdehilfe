#include <ScreenCapture.au3>
#include <Color.au3>

_GDIPlus_Startup()

$hBmp = _ScreenCapture_Capture("") ; erstelle Screenshot
$hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hBmp) ; erstelle ein Bitmap aus Screenshot zur Verwendung mit GDI+
_WinAPI_DeleteObject($hBmp) ; lösche Screenshot aus Speicher

_GreyScale($hBitmap, 50, 50, 300, 200) ; Bereich wird in Graustufen umberechnet

$hGraphics = _GDIPlus_ImageGetGraphicsContext($hBitmap) ; erstelle Grafikhandle um auf dem Bitmap zu zeichnen
_GDIPlus_GraphicsDrawRect($hGraphics, 50, 50, 300, 200) ; zeichne Umrandung des ergrauten Bereiches
_GDIPlus_GraphicsDispose($hGraphics) ; gibt Grafikhandle wieder frei

_GDIPlus_ImageSaveToFile($hBitmap, @MyDocumentsDir & "\_GDIPlus_BitmapLockBits.jpg") ; speichere fertiges Bild

_GDIPlus_BitmapDispose($hBitmap) ; lösche Bild aus dem Speicher
_GDIPlus_Shutdown()

Func _GreyScale($hBitmap, $iX, $iY, $iW, $iH)
	Local $BitmapData = _GDIPlus_BitmapLockBits($hBitmap, $iX, $iY, $iW, $iH, BitOR($GDIP_ILMREAD, $GDIP_ILMWRITE), $GDIP_PXF32RGB)
	Local $Stride = DllStructGetData($BitmapData, "Stride") ; Stride ist der Offset von einer Reihe zur nächsten
	Local $Width = DllStructGetData($BitmapData, "Width") ; Anzahl der Spalten
	Local $Height = DllStructGetData($BitmapData, "Height") ; Anzahl der Reihen
	Local $Scan0 = DllStructGetData($BitmapData, "Scan0") ; Die Bilddaten im Speicher
	Local $PixelData, $Color, $Luma
	For $row = 0 To $Height - 1 ; Reihe für Reihe
		For $col = 0 To $Width - 1 ; Spalte für Spalte
			; lese Farbinformation des aktuellen Pixels(Spalte,Reihe) aus
			$PixelData = DllStructCreate("dword", $Scan0 + ($row * $Stride) + ($col * 4))
			$Color = DllStructGetData($PixelData, 1)
			; berechne Grauwert
			$Luma = _ColorGetRed($Color) * 0.3 + _ColorGetGreen($Color) * 0.59 + _ColorGetBlue($Color) * 0.11
			; Rot Grün und Blau wert werden jeweils auf den berechneten Grauwert gesetzt
			DllStructSetData($PixelData, 1, BitOR($Luma, BitShift($Luma, -8), BitShift($Luma, -16)))
		Next
	Next
	_GDIPlus_BitmapUnlockBits($hBitmap, $BitmapData)
EndFunc   ;==>_GreyScale