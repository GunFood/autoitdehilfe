#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <ScreenCapture.au3>
#include <WinAPIHObj.au3>

Example()

Func Example()
	_GDIPlus_Startup() ; Initialisiert (startet) Microsoft Windows GDI+
	Local Const $iWidth = 600, $iHeight = 600

	Local $hGUI = GUICreate("GDI+ Beispiel (" & @ScriptName & ")", $iWidth, $iHeight) ; Erstellt eine Test GUI
	GUISetState(@SW_SHOW)

	Local $hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI) ; Erstellt ein Grafikobjekt von einem Fensterhandle
	Local $pIA = _GDIPlus_ImageAttributesCreate() ; Erstellt ein ImageAttribute Objekt

	; Erstellt die Farbmatrix die verwendet wird um die Farben des Bildes zu justieren
	Local $tColorMatrix = _GDIPlus_ColorMatrixCreateTranslate(-1, -1, 0) ; Verwendet eine Translationsfarbmatrix um ein bluaskaliertes Bild zu erstellen

	_GDIPlus_ImageAttributesSetColorMatrix($pIA, 0, True, $tColorMatrix) ; Justiert den ImageAttribute Farbkey Farbmatrix

	Local $hHBmp = _ScreenCapture_Capture("", 0, 0, $iWidth, $iHeight) ; Erstellt ein GDI Bitmap durch einen Screenshot des Desktops
	Local $hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hHBmp) ; Konvertiert GDI in GDI+ Bitmap
	_WinAPI_DeleteObject($hHBmp) ; Gibt GDI Bitmap Ressourcen frei, da diese nicht mehr benötigt werden
	_GDIPlus_GraphicsDrawImageRectRect($hGraphics, $hBitmap, 0, 0, $iWidth, $iHeight, 0, 0, $iWidth, $iHeight, $pIA) ; Zeichnet das Bitmap während die Farbjustierung angeandt wird

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_ImageAttributesDispose($pIA)
	_GDIPlus_GraphicsDispose($hGraphics)
	_GDIPlus_BitmapDispose($hBitmap)
	_GDIPlus_Shutdown()
	GUIDelete($hGUI)
EndFunc   ;==>Example
