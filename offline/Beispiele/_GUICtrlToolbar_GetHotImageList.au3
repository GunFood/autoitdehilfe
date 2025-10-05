#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiToolbar.au3>
#include <WinAPIGdi.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate('Toolbar: Setzt und ermittelt die "hot" Button Imagelist (v' & @AutoItVersion & ")", 600, 300)
	GUISetBkColor(0xffff00)
	Local $hToolbar = _GUICtrlToolbar_Create($hGUI)
	_MemoCreate(2, 36, 396, 262, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Erstellt eine normale Imagelist
	Local $hNormal = _GUIImageList_Create(32, 24)
	_GUIImageList_Add($hNormal, _WinAPI_CreateSolidBitmap($hGUI, 0xFF0000, 32, 24))
	_GUIImageList_Add($hNormal, _WinAPI_CreateSolidBitmap($hGUI, 0x00FF00, 32, 24))
	_GUIImageList_Add($hNormal, _WinAPI_CreateSolidBitmap($hGUI, 0x0000FF, 32, 24))
	_GUICtrlToolbar_SetImageList($hToolbar, $hNormal)

	; Erstellt eine deaktivierte Imagelist
	Local $hDisabled = _GUIImageList_Create(32, 24)
	_GUIImageList_Add($hDisabled, _WinAPI_CreateSolidBitmap($hGUI, 0xCCCCCC, 32, 24))
	_GUIImageList_Add($hDisabled, _WinAPI_CreateSolidBitmap($hGUI, 0xCCCCCC, 32, 24))
	_GUIImageList_Add($hDisabled, _WinAPI_CreateSolidBitmap($hGUI, 0xCCCCCC, 32, 24))
	_GUICtrlToolbar_SetDisabledImageList($hToolbar, $hDisabled)

	; Erstellt eine 'hot' Imagelist
	Local $hHot = _GUIImageList_Create(32, 24)
	_GUIImageList_Add($hHot, _WinAPI_CreateSolidBitmap($hGUI, 0x111111, 32, 24))
	_GUIImageList_Add($hHot, _WinAPI_CreateSolidBitmap($hGUI, 0x888888, 32, 24))
	_GUIImageList_Add($hHot, _WinAPI_CreateSolidBitmap($hGUI, 0xAAAAAA, 32, 24))
	Local $hPrevImageList = _GUICtrlToolbar_SetHotImageList($hToolbar, $hHot)
	_MemoWrite("Vorheriges Handle der Hot Imagelist .: 0x" & Hex($hPrevImageList))
	_MemoWrite("IsPtr = " & IsPtr($hPrevImageList) & " IsHWnd = " & IsHWnd($hPrevImageList))

	; Fügt die Buttons hinzu
	Local Enum $idRed = 1000, $idGreen, $idBlue
	_GUICtrlToolbar_AddButton($hToolbar, $idRed, 0)
	_GUICtrlToolbar_AddButton($hToolbar, $idGreen, 1)
	_GUICtrlToolbar_AddButton($hToolbar, $idBlue, 2)

	; Deaktiviert den blauen Button
	_GUICtrlToolbar_EnableButton($hToolbar, $idBlue, False)

	; Zeigt die Handles der Imagelisten
	_MemoWrite("Handle der deaktivierten Imagelist : 0x" & Hex(_GUICtrlToolbar_GetDisabledImageList($hToolbar)))
	_MemoWrite("Handle der 'hot' Imagelist ........: 0x" & Hex(_GUICtrlToolbar_GetHotImageList($hToolbar)))
	_MemoWrite("IsPtr = " & IsPtr(_GUICtrlToolbar_GetHotImageList($hToolbar)) & " IsHWnd = " & IsHWnd(_GUICtrlToolbar_GetHotImageList($hToolbar)))
	_MemoWrite("Handle der normalen Imagelist .....: 0x" & Hex(_GUICtrlToolbar_GetImageList($hToolbar)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
