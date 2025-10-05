#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <WinAPIGdi.au3>
#include <WinAPIGdiDC.au3>

Example()

Func Example()
	Local $hImage, $hGui, $hDC, $tInfo

	$hGui = GUICreate("ImageList: Ermittelt erweiterte Icon-Informationen (InfoEx)", 400, 300)
	_MemoCreate(2, 32, 396, 266, 0)
	GUISetState(@SW_SHOW)

	; Lädt die Bilder
	$hImage = _GUIImageList_Create(32, 24)
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0xFF0000, 32, 24))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0x00FF00, 32, 24))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGui, 0x0000FF, 32, 24))

	; Zeichnet die Bilder
	$hDC = _WinAPI_GetDC($hGui)
	_GUIImageList_Draw($hImage, 0, $hDC, 4, 4)
	_GUIImageList_Draw($hImage, 1, $hDC, 40, 4)
	_GUIImageList_Draw($hImage, 2, $hDC, 76, 4)

	_WinAPI_ReleaseDC($hGui, $hDC)

	; Zeigt die Informationen des zweiten Bildes
	$tInfo = _GUIImageList_GetImageInfoEx($hImage, 1)
	_MemoWrite("Handle des Bildes .: 0x" & Hex(DllStructGetData($tInfo, "hBitmap")))
	_MemoWrite("Handle der Maske ..: " & DllStructGetData($tInfo, "hMask"))
	_MemoWrite("Linke Seite des Bildes ...: " & DllStructGetData($tInfo, "Left"))
	_MemoWrite("Obere Seite des Bildes  ....: " & DllStructGetData($tInfo, "Top"))
	_MemoWrite("Rechte Seite des Bildes ..: " & DllStructGetData($tInfo, "Right"))
	_MemoWrite("Untere Seite des Bildes .: " & DllStructGetData($tInfo, "Bottom"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
