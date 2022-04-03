#include <GDIPlus.au3>
#include <GuiConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hImage, $sFile, $hGUI, $hGraphic, $hThumbnail, $iW_new, $iH_new

	$sFile = FileOpenDialog("Bitte ein Bild auswählene", "", "Image (*.jpg;*.png;*.bmp;*.gif;*.tif)", BitOR($FD_PATHMUSTEXIST, $FD_FILEMUSTEXIST))
	If @error Then Exit MsgBox(($MB_TOPMOST + $MB_ICONERROR), "Fehler", "Es wurde kein Bild ausgewählt", 30)

	_GDIPlus_Startup()

	$hImage = _GDIPlus_ImageLoadFromFile($sFile)
	If @error Or Not $hImage Then
		MsgBox(($MB_TOPMOST + $MB_ICONERROR), "Fehler", "Diese Datei wird nicht von GDIPlus unterstützt!")
	Else
		$hGUI = GUICreate("GDI+ _GDIPlus_ImageGetThumbnail Demo", 320, 200)
		GUISetBkColor(0x202020)
		GUISetState()

		$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
		$hThumbnail = _GDIPlus_ImageGetThumbnail($hImage, 96, 96)
		$iW_new = _GDIPlus_ImageGetWidth($hThumbnail)
		$iH_new = _GDIPlus_ImageGetHeight($hThumbnail)
		_GDIPlus_GraphicsDrawImageRect($hGraphic, $hThumbnail, (320 - $iW_new) / 2, (200 - $iH_new) / 2, $iW_new, $iH_new) ;zentriert das Bild in der GUI

		Do
		Until GUIGetMsg() = $GUI_EVENT_CLOSE

		_GDIPlus_ImageDispose($hImage)
		_GDIPlus_ImageDispose($hThumbnail)
	EndIf

	_GDIPlus_Shutdown()
EndFunc   ;==>Example
