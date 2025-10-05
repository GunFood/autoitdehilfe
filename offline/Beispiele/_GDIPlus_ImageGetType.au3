#include "Extras\HelpFileInternals.au3"

#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <ScreenCapture.au3>
#include <WinAPIHObj.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hBitmap, $hImage, $iImageType, $sImageType

	; Erstellt eine GUI
	GUICreate("GDI+", 600, 400)
	_MemoCreate(2, 2, 596, 396, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; Erstellt vom kompletten Bildschirm einen Screenshot und erzeugt daraus eine 32 bit Bitmap
	$hBitmap = _ScreenCapture_Capture("")
	$hImage = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap)

	$iImageType = _GDIPlus_ImageGetType($hImage)
	Switch $iImageType
		Case $GDIP_IMAGETYPE_UNKNOWN
			$sImageType = "Unbekanntes Bitmap Format oder keine Bilddatei"
		Case $GDIP_IMAGETYPE_BITMAP ; BMP, PNG, GIF, JPEG, TIFF, ICO, EXIF
			$sImageType = "Bitmap"
		Case $GDIP_IMAGETYPE_METAFILE ; EMF, WMF
			$sImageType = "Metafile"
	EndSwitch

	; Zeigt den Bildtyp: Unbekannt = 0, Bitmap = 1, Metafile = 2)
	_MemoWrite("Bildtyp: " & $sImageType);

	; Ressourcen freigeben
	_GDIPlus_ImageDispose($hImage)
	_WinAPI_DeleteObject($hBitmap)

	; Gibt die durch Microsoft Windows GDI+ verwendeten Ressourcen wieder frei
	_GDIPlus_Shutdown()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example