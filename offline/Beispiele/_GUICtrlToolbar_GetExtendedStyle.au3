#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiMenu.au3>
#include <GuiToolbar.au3>
#include <StructureConstants.au3>
#include <WinAPIConstants.au3>
#include <WindowsNotifsConstants.au3>
#include <WindowsStylesConstants.au3>

Global $g_hGUI

Example()

Func Example()
	Local $hToolbar
	Local Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $e_idHelp

	; Erstellt eine GUI
	$hGui = GUICreate("Toolbar", 400, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGui)
	_GUICtrlToolbar_SetExtendedStyle($hToolbar, $TBSTYLE_EX_DRAWDDARROWS)
	_MemoCreate(2, 36, 396, 262, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Fügt die Standard Systembitmaps hinzu
	Switch _GUICtrlToolbar_GetBitmapFlags($hToolbar)
		Case 0
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_SMALL_COLOR)
		Case 2
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)
	EndSwitch

	; Fügt die Buttons hinzu
	_GUICtrlToolbar_AddButton($hToolbar, $e_idNew, $STD_FILENEW, 0, $idBtnS_DROPDOWN)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idOpen, $STD_FILEOPEN)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idSave, $STD_FILESAVE)
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idHelp, $STD_HELP)

	; Zeigt die verwendeten erweiterten Stile
	_MemoWrite("Erweiterte Stile: " & _GUICtrlToolbar_GetExtendedStyle($hToolbar))

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Verarbeitet die TBN_DROPDOWN Nachricht
Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $tNMHDR, $iCode, $hMenu

	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$iCode = DllStructGetData($tNMHDR, "Code")

	If $iCode = $TBN_DROPDOWN Then
		$hMenu = _GUICtrlMenu_CreatePopup()
		_GUICtrlMenu_AddMenuItem($hMenu, "Template 1", 2000)
		_GUICtrlMenu_AddMenuItem($hMenu, "Template 2", 2001)
		_GUICtrlMenu_AddMenuItem($hMenu, "Template 3", 2002)
		_GUICtrlMenu_TrackPopupMenu($hMenu, $hGui)
		_GUICtrlMenu_DestroyMenu($hMenu)
	EndIf
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
