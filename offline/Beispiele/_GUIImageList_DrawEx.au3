#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <WinAPIGdi.au3>
#include <WinAPIGdiDC.au3>

Example()

Func Example()
	Local $hImage, $hGui, $hDC

	$hGui = GUICreate("ImageList: ein Item aus einer Imagelist an dem festgelegten Bereich zeichnen", 400, 300)
	GUISetState(@SW_SHOW)

	; Lädt die Bilder
	$hImage = _GUIImageList_Create(32, 24)
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0xFF0000, 32, 24))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0x00FF00, 32, 24))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0x0000FF, 32, 24))

	; Zeichnet die Bilder
	$hDC = _WinAPI_GetDC($hGui)
	_GUIImageList_DrawEx($hImage, 0, $hDC, 4, 4)
	_GUIImageList_DrawEx($hImage, 1, $hDC, 40, 4)
	_GUIImageList_DrawEx($hImage, 2, $hDC, 76, 4)

	_WinAPI_ReleaseDC($hGui, $hDC)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
