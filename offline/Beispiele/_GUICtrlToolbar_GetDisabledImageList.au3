#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiToolbar.au3>
#include <WinAPIGdi.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGui, $hToolbar, $hNormal, $hDisabled, $hHot
	Local Enum $idRed = 1000, $idGreen, $idBlue

	; Erstellt eine GUI
	$hGui = GUICreate("Toolbar", 400, 300)
	GUISetBkColor(0xffff00)
	$hToolbar = _GUICtrlToolbar_Create($hGui)
	$g_idMemo = GUICtrlCreateEdit("", 2, 36, 396, 262, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 10, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Erstellt eine normale Imagelist
	$hNormal = _GUIImageList_Create(32, 24)
	_GUIImageList_Add($hNormal, _WinAPI_CreateSolidBitmap($hGui, 0xFF0000, 32, 24))
	_GUIImageList_Add($hNormal, _WinAPI_CreateSolidBitmap($hGui, 0x00FF00, 32, 24))
	_GUIImageList_Add($hNormal, _WinAPI_CreateSolidBitmap($hGui, 0x0000FF, 32, 24))
	_GUICtrlToolbar_SetImageList($hToolbar, $hNormal)

	; Erstellt eine deaktivierte Imagelist
	$hDisabled = _GUIImageList_Create(32, 24)
	_GUIImageList_Add($hDisabled, _WinAPI_CreateSolidBitmap($hGui, 0xCCCCCC, 32, 24))
	_GUIImageList_Add($hDisabled, _WinAPI_CreateSolidBitmap($hGui, 0xCCCCCC, 32, 24))
	_GUIImageList_Add($hDisabled, _WinAPI_CreateSolidBitmap($hGui, 0xCCCCCC, 32, 24))
	_GUICtrlToolbar_SetDisabledImageList($hToolbar, $hDisabled)

	; Erstellt eine 'hot' Imagelist
	$hHot = _GUIImageList_Create(32, 24)
	_GUIImageList_Add($hHot, _WinAPI_CreateSolidBitmap($hGui, 0x111111, 32, 24))
	_GUIImageList_Add($hHot, _WinAPI_CreateSolidBitmap($hGui, 0x888888, 32, 24))
	_GUIImageList_Add($hHot, _WinAPI_CreateSolidBitmap($hGui, 0xAAAAAA, 32, 24))
	_GUICtrlToolbar_SetHotImageList($hToolbar, $hHot)

	; Fügt die Buttons hinzu
	_GUICtrlToolbar_AddButton($hToolbar, $idRed, 0)
	_GUICtrlToolbar_AddButton($hToolbar, $idGreen, 1)
	_GUICtrlToolbar_AddButton($hToolbar, $idBlue, 2)

	; Deaktiviert den blauen Button
	_GUICtrlToolbar_EnableButton($hToolbar, $idBlue, False)

	; Zeigt die Handles der Imagelisten
	MemoWrite("Handle der deaktivierten Imagelist : 0x" & Hex(_GUICtrlToolbar_GetDisabledImageList($hToolbar)))
	MemoWrite("IsPtr = " & IsPtr(_GUICtrlToolbar_GetDisabledImageList($hToolbar)) & " IsHWnd = " & IsHWnd(_GUICtrlToolbar_GetDisabledImageList($hToolbar)))
	MemoWrite("Handle der 'hot' Imagelist ........: 0x" & Hex(_GUICtrlToolbar_GetHotImageList($hToolbar)))
	MemoWrite("Handle der normalen Imagelist .....: 0x" & Hex(_GUICtrlToolbar_GetImageList($hToolbar)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
