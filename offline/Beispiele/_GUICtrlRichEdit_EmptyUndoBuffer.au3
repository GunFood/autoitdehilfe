#include <GUIConstantsEx.au3>
#include <GuiMenu.au3>
#include <GuiRichEdit.au3>
#include <StructureConstants.au3>
#include <WindowsNotifsConstants.au3>
#include <WindowsStylesConstants.au3>

Global $g_hRichEdit, $g_idMnu, $g_idMni_Undo, $g_idMni_Redo, $g_idMni_Empty

Example()

Func Example()
	Local $hGui
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$g_hRichEdit = _GUICtrlRichEdit_Create($hGui, "Das ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	$g_idMnu = GUICtrlCreateContextMenu(GUICtrlCreateDummy())
	$g_idMni_Undo = GUICtrlCreateMenuItem("Rückgängig", $g_idMnu)
	$g_idMni_Redo = GUICtrlCreateMenuItem("Wiederholen", $g_idMnu)
	GUICtrlCreateMenuItem("", $g_idMnu)
	$g_idMni_Empty = GUICtrlCreateMenuItem("Lösche Rückgängig Puffer", $g_idMnu)

	_GUICtrlRichEdit_SetEventMask($g_hRichEdit, $ENM_MOUSEEVENTS)

	While True
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($g_hRichEdit) ; wird benötigt, da sonst das Skript abstürzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
			Case $g_idMni_Undo
				_GUICtrlRichEdit_Undo($g_hRichEdit)
			Case $g_idMni_Redo
				_GUICtrlRichEdit_Redo($g_hRichEdit)
			Case $g_idMni_Empty
				_GUICtrlRichEdit_EmptyUndoBuffer($g_hRichEdit)
		EndSwitch
	WEnd
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $iMsg, $wParam
	Local $hWndFrom, $iCode, $tNMHDR, $tMsgFilter, $hMenu
	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $g_hRichEdit
			Select
				Case $iCode = $EN_MSGFILTER
					$tMsgFilter = DllStructCreate($tagMSGFILTER, $lParam)
					If DllStructGetData($tMsgFilter, "msg") = $WM_RBUTTONUP Then
						$hMenu = GUICtrlGetHandle($g_idMnu)
						SetMenuTexts($hWndFrom, $hMenu)
						_GUICtrlMenu_TrackPopupMenu($hMenu, $hWnd)
					EndIf
			EndSelect
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func SetMenuTexts($hWnd, $hMenu)
	If _GUICtrlRichEdit_CanUndo($hWnd) Then
		_GUICtrlMenu_SetItemEnabled($hMenu, $g_idMni_Undo, True, False)
		_GUICtrlMenu_SetItemText($hMenu, $g_idMni_Undo, "Rückgängig: " & _GUICtrlRichEdit_GetNextUndo($hWnd), False)
		_GUICtrlMenu_SetItemEnabled($hMenu, $g_idMnuEmpty, True, False)
	Else
		_GUICtrlMenu_SetItemText($hMenu, $g_idMni_Undo, "Rückgängig", False)
		_GUICtrlMenu_SetItemEnabled($hMenu, $g_idMni_Undo, False, False)
		_GUICtrlMenu_SetItemEnabled($hMenu, $g_idMnuEmpty, False, False)
	EndIf
	If _GUICtrlRichEdit_CanRedo($hWnd) Then
		_GUICtrlMenu_SetItemEnabled($hMenu, $g_idMni_Redo, True, False)
		_GUICtrlMenu_SetItemText($hMenu, $g_idMni_Redo, "Wiederholen: " & _GUICtrlRichEdit_GetNextRedo($hWnd), False)
	Else
		_GUICtrlMenu_SetItemText($hMenu, $g_idMni_Redo, "Wiederholen", False)
		_GUICtrlMenu_SetItemEnabled($hMenu, $g_idMni_Redo, False, False)
	EndIf
EndFunc   ;==>SetMenuTexts
