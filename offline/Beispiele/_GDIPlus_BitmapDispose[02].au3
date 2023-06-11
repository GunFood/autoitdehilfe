#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>
#include <ScreenCapture.au3>

_Main()

Func _Main()
	Local $hGUI, $hBMP, $hBitmap, $hGraphic

	; Erstellt vom oberen, linken Bereich des Bildschirms einen Screenshot
	$hBMP = _ScreenCapture_Capture("", 0, 0, 400, 300)

	; Erstellt eine GUI
	$hGUI = GUICreate("GDI+", 400, 300)
	GUISetState()

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; Zeichnet ein Bitmap auf die GUI
	$hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hBMP)
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	_GDIPlus_GraphicsDrawImage($hGraphic, $hBitmap, 0, 0)

	; Ressourcen freigeben
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_BitmapDispose($hBitmap)
	_WinAPI_DeleteObject($hBMP)

	; Gibt die durch Microsoft Windows GDI+ verwendeten Ressourcen wieder frei
	_GDIPlus_Shutdown()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE


EndFunc   ;==>_Main
