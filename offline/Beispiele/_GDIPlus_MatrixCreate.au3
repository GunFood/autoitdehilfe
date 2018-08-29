#include <GDIPlus.au3>
#include <ScreenCapture.au3>
#include <WinAPIHObj.au3>

Example()

Func Example()
	Local $hBitmap1, $hBitmap2, $hImage1, $hImage2, $hGraphic, $iWidth, $iHeight

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; Erstellt vom kompletten Bildschirm einen Screenshot
	$hBitmap1 = _ScreenCapture_Capture("")
	$hImage1 = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap1)

	; Erstellt von einem Bereich einen Screenshot
	$hBitmap2 = _ScreenCapture_Capture("", 0, 0, 400, 300)
	$hImage2 = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap2)

	$iWidth = _GDIPlus_ImageGetWidth($hImage2)
	$iHeight = _GDIPlus_ImageGetHeight($hImage2)

	; Zeichnet ein Bild in ein $fAngle
	$hGraphic = _GDIPlus_ImageGetGraphicsContext($hImage1)

	; DrawInsert($hGraphic, $hImage2, $iX, $iY, $fAngle,    $iWidth,    $iHeight, $iARGB = 0xFF000000, $iPenWidth = 1)
	DrawInsert($hGraphic, $hImage2, 350, 100, 0, $iWidth + 2, $iHeight + 2, 0xFFFF8000, 2)
	DrawInsert($hGraphic, $hImage2, 340, 50, 15, 200, 150, 0xFFFF8000, 4)
	DrawInsert($hGraphic, $hImage2, 310, 30, 35, $iWidth + 4, $iHeight + 4, 0xFFFF00FF, 4)
	DrawInsert($hGraphic, $hImage2, 320, 790, -35, $iWidth, $iHeight)

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

; #FUNCTION# ==================================================================================================
; Name...........: DrawInsert
; Beschreibung...: Zeichnet ein Bild in ein $fAngle
; Syntax.........: DrawInsert($hGraphic, $hImage2, $iX, $iY, $fAngle, $iWidth, $iHeight, $iARGB = 0xFF000000, $iPenWidth = 1)
; Fügt das Bild $hImage2 in $hGraphic ein
;
; Parameter......: $hGraphics   - Handle zum Grafikobjekt
;                  $hImage      - Handle zum einzufügenden Bild-Objekt
;                  $iX          - X-Koordinate der oberen linken Ecke des eingefügten Bildes
;                  $iY          - Y-Koordinate der oberen linken Ecke des eingefügten Bildes
;                  $iWidth      - Breite des Rechteckrahmens um das eingefügte Bild
;                  $iHeight     - Höhe des Rechteckrahmens um das eingefügte Bild
;                  $iARGB       - Alpha, Rot, Grün und Blau: Komponenten der Stiftfarbe des Rahmens
;                  $iPenWidth   - Breite des Zeichenstifts für den Rahmen
;                                 (die Einheit wird im $iUnit-Parameter der _GDIPlus_PenCreate-Funktion festgelegt)
;
; Rückgabewerte..: Erfolg       - True
;                  Fehler       - False
;==================================================================================================
Func DrawInsert($hGraphic, $hImage2, $iX, $iY, $fAngle, $iWidth, $iHeight, $iARGB = 0xFF000000, $iPenWidth = 1)
	Local $hMatrix, $hPen2

	; Rotationsmatrix
	$hMatrix = _GDIPlus_MatrixCreate()
	_GDIPlus_MatrixRotate($hMatrix, $fAngle, "False")
	_GDIPlus_GraphicsSetTransform($hGraphic, $hMatrix)

	_GDIPlus_GraphicsDrawImage($hGraphic, $hImage2, $iX, $iY)

	; Ermittelt Stift + Farbe
	$hPen2 = _GDIPlus_PenCreate($iARGB, $iPenWidth)

	; Zeichnet einen Rahmen um das eingefügte Bild
	_GDIPlus_GraphicsDrawRect($hGraphic, $iX, $iY, $iWidth, $iHeight, $hPen2)

	; Ressourcen freigeben
	_GDIPlus_MatrixDispose($hMatrix)
	_GDIPlus_PenDispose($hPen2)
	Return 1
EndFunc   ;==>DrawInsert
