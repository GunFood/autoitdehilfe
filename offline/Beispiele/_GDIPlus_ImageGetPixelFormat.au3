#include "Extras\HelpFileInternals.au3"

#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <ScreenCapture.au3>
#include <WinAPIHObj.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hBitmap, $hImage, $aRet

	; Erstellt eine GUI
	GUICreate("GDI+", 600, 400)
	_MemoCreate(2, 2, 596, 396, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; Erstellt vom kompletten Bildschirm einen Screenshot und erzeugt daraus eine 32 bit Bitmap
	$hBitmap = _ScreenCapture_Capture("")
	$hImage = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap)

	; Gibt das Pixelformat des Screenshots zurück
	$aRet = _GDIPlus_ImageGetPixelFormat($hImage)
	_MemoWrite("String mit Beschreibung des Pixelformats: " & $aRet[1]);
	_MemoWrite("Pixelformat als Integer-Konstante             : " & $aRet[0]);
	_MemoWrite();

	; Speichert den Screenshot-Bitmap in eine Datei
	_GDIPlus_ImageSaveToFile($hImage, @MyDocumentsDir & "\GDIPlus_Image.jpg")

	; Ressourcen freigeben
	_GDIPlus_ImageDispose($hImage)
	_WinAPI_DeleteObject($hBitmap)

	; Lädt das Screenshot-Bitmap von einer Datei
	$hImage = _GDIPlus_ImageLoadFromFile(@MyDocumentsDir & "\GDIPlus_Image.jpg")

	; Gibt das Pixelformat der gespeicherten Datei zurück
	$aRet = _GDIPlus_ImageGetPixelFormat($hImage)
	_MemoWrite("String mit Beschreibung des Pixelformats: " & $aRet[1]);
	_MemoWrite("Pixelformat als Integer-Konstante             : " & $aRet[0]);

	; Ressourcen freigeben
	_GDIPlus_ImageDispose($hImage)

	; Gibt die durch Microsoft Windows GDI+ verwendeten Ressourcen wieder frei
	_GDIPlus_Shutdown()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example