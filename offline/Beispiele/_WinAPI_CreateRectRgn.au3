#include <GUIConstantsEx.au3>
#include <WinAPIGdi.au3>
#include <WinAPIHObj.au3>
#include <WinAPISys.au3>
#include <WindowsConstants.au3>

; Ermittelt die Höhe des Fenstertitels und die Breite des Fensterrahmens - kann je nach XP-Thema variieren.
Global $g_iHtit = _WinAPI_GetSystemMetrics($SM_CYCAPTION)
Global $g_iFrame = _WinAPI_GetSystemMetrics($SM_CXDLGFRAME)

Global $g_hGui = GUICreate("Teste Fensterregionen", 350, 210)
Local $id_default = GUICtrlCreateButton("Standard-Region", 100, 30, 150)
Local $id_round = GUICtrlCreateButton("Abgerundete Region", 100, 60, 150)
Local $id_buble = GUICtrlCreateButton("Blasen-Region ", 100, 90, 150)
Local $id_transparent = GUICtrlCreateButton("Transparente Region", 100, 120, 150)
Local $id_exit = GUICtrlCreateButton("Beenden", 100, 150, 150)
GUISetState(@SW_SHOW)

Local $aPos = WinGetPos($g_hGui) ; Ermittelt die Größe des gesamten Fensters (weil keine Client-Größe bei GUICreate angegeben wurde)
Global $g_iWidth = $aPos[2]
Global $g_iHeight = $aPos[3]

Local $iMsg, $hRgn
While 1
	$iMsg = GUIGetMsg()
	Select
		Case $iMsg = $Gui_EVENT_CLOSE Or $iMsg = $id_exit
			ExitLoop

		Case $iMsg = $id_default ; Standard
			$hRgn = _WinAPI_CreateRectRgn(0, 0, $g_iWidth, $g_iHeight)
			_WinAPI_SetWindowRgn($g_hGui, $hRgn)

		Case $iMsg = $id_round ; Abgerundet
			$hRgn = _WinAPI_CreateRoundRectRgn(0, 0, $g_iWidth, $g_iHeight, $g_iWidth / 3, $g_iHeight / 3)
			_WinAPI_SetWindowRgn($g_hGui, $hRgn)

		Case $iMsg = $id_buble ; Blasen
			Local $hRgn1 = _WinAPI_CreateRoundRectRgn(0, 0, $g_iWidth / 2, $g_iHeight / 2, $g_iWidth / 2, $g_iHeight / 2) ; Links oben
			Local $hRgn2 = _WinAPI_CreateRoundRectRgn($g_iWidth / 2, 0, $g_iWidth, $g_iHeight / 2, $g_iWidth / 2, $g_iHeight / 2) ; Rechts oben
			_WinAPI_CombineRgn($hRgn1, $hRgn1, $hRgn2, $RGN_OR)
			_WinAPI_DeleteObject($hRgn2)
			$hRgn2 = _WinAPI_CreateRoundRectRgn(0, $g_iHeight / 2, $g_iWidth / 2, $g_iHeight, $g_iWidth / 2, $g_iHeight / 2) ; Links unten
			_WinAPI_CombineRgn($hRgn1, $hRgn1, $hRgn2, $RGN_OR)
			_WinAPI_DeleteObject($hRgn2)
			$hRgn2 = _WinAPI_CreateRoundRectRgn($g_iWidth / 2, $g_iHeight / 2, $g_iWidth, $g_iHeight, $g_iWidth / 2, $g_iHeight / 2) ; Rechts unten
			_WinAPI_CombineRgn($hRgn1, $hRgn1, $hRgn2, $RGN_OR)
			_WinAPI_DeleteObject($hRgn2)
			$hRgn2 = _WinAPI_CreateRoundRectRgn(10, 10, $g_iWidth - 10, $g_iHeight - 10, $g_iWidth, $g_iHeight) ; Mitte
			_WinAPI_CombineRgn($hRgn1, $hRgn1, $hRgn2, $RGN_OR)
			_WinAPI_DeleteObject($hRgn2)
			_WinAPI_SetWindowRgn($g_hGui, $hRgn1)

		Case $iMsg = $id_transparent ; Transparent
			_GuiHole($g_hGui, 40, 40, 260, 170)

	EndSelect
WEnd

; Macht den inneren Bereich transparent (aber Regionen für die Controls werden eingefügt)
Func _GuiHole($h_win, $i_x, $i_y, $i_sizew, $i_sizeh)
	Local $hOuter_rgn, $hInner_rgn, $hCombined_rgn

	$hOuter_rgn = _WinAPI_CreateRectRgn(0, 0, $g_iWidth, $g_iHeight)
	$hInner_rgn = _WinAPI_CreateRectRgn($i_x, $i_y, $i_x + $i_sizew, $i_y + $i_sizeh)
	$hCombined_rgn = _WinAPI_CreateRectRgn(0, 0, 0, 0)
	_WinAPI_CombineRgn($hCombined_rgn, $hOuter_rgn, $hInner_rgn, $RGN_DIFF)
	_WinAPI_DeleteObject($hOuter_rgn)
	_WinAPI_DeleteObject($hInner_rgn)
	_AddCtrlRegion($hCombined_rgn, $id_default)
	_AddCtrlRegion($hCombined_rgn, $id_round)
	_AddCtrlRegion($hCombined_rgn, $id_buble)
	_AddCtrlRegion($hCombined_rgn, $id_transparent)
	_AddCtrlRegion($hCombined_rgn, $id_exit)
	_WinAPI_SetWindowRgn($h_win, $hCombined_rgn)
EndFunc   ;==>_GuiHole

; Fügt den Bereich eines Controls einer Region hinzu, dabei werden
; Die Größe des Fenstertitels und des Fensterrahmens berücksichtigt.
Func _AddCtrlRegion($full_rgn, $ctrl_id)
	Local $aCtrl_pos, $hCtrl_rgn

	$aCtrl_pos = ControlGetPos($g_hGui, "", $ctrl_id)
	$hCtrl_rgn = _WinAPI_CreateRectRgn($aCtrl_pos[0] + $g_iFrame, $aCtrl_pos[1] + $g_iHtit + $g_iFrame, _
			$aCtrl_pos[0] + $aCtrl_pos[2] + $g_iFrame, $aCtrl_pos[1] + $aCtrl_pos[3] + $g_iHtit + $g_iFrame)
	_WinAPI_CombineRgn($full_rgn, $full_rgn, $hCtrl_rgn, $RGN_OR)
	_WinAPI_DeleteObject($hCtrl_rgn)
EndFunc   ;==>_AddCtrlRegion
