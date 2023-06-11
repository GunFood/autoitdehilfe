#include <Extras\WM_NOTIFY.au3>
#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <WindowsConstants.au3>

Global $g_idListView

Example()

Func Example()
	GUICreate("ListView: Beendet das Editieren des Itemtextes (v" & @AutoItVersion & ")", 392, 322)
	$g_idListView = GUICtrlCreateListView("", 2, 2, 394, 268, BitOR($LVS_EDITLABELS, $LVS_REPORT))
	GUISetState(@SW_SHOW)

	_WM_NOTIFY_Register()

	; Lädt die Bilder
	Local $hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($g_idListView), 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($g_idListView), 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($g_idListView), 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($g_idListView, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_InsertColumn($g_idListView, 0, "Spalte 1", 120)
	_GUICtrlListView_InsertColumn($g_idListView, 1, "Spalte 2", 120)
	_GUICtrlListView_InsertColumn($g_idListView, 2, "Spalte 3", 120)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($g_idListView, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($g_idListView, 0, "Zeile 1: Spalte 2", 1)
	_GUICtrlListView_AddSubItem($g_idListView, 0, "Zeile 1: Spalte 3", 2)
	_GUICtrlListView_AddItem($g_idListView, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($g_idListView, 1, "Zeile 2: Spalte 2", 1)
	_GUICtrlListView_AddItem($g_idListView, "Zeile 3: Spalte 1", 2)

	; Ermöglicht das Ändern der Bezeichnung des Items 0 (zeitbegrenzt)
	_GUICtrlListView_EditLabel($g_idListView, 0)
	Local $hTime = TimerInit()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
		If _GUICtrlListView_GetEditControl($g_idListView) <> 0 Then
			If TimerDiff($hTime) > 3000 Then _GUICtrlListView_CancelEditLabel($g_idListView)
		EndIf
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndListView = $g_idListView
	$hWndListView = $g_idListView
	If Not IsHWnd($g_idListView) Then $hWndListView = GUICtrlGetHandle($g_idListView)

	Local $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	Local $iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndListView
			Switch $iCode
				Case $LVN_COLUMNCLICK ; Es wurde auf eine Spalte geklickt
					_WM_NOTIFY_DebugEvent("$LVN_COLUMNCLICK", $tagNMLISTVIEW, $lParam, "IDFrom,,Item,SubItem,NewState,OldState,Changed,ActionX,ActionY,Param")
					; Kein Rückgabewert
				Case $LVN_ITEMCHANGING ; Ein Item wird geändert
					_WM_NOTIFY_DebugEvent("$LVN_ITEMCHANGING", $tagNMLISTVIEW, $lParam, "IDFrom,,Item,SubItem,NewState,OldState,Changed,ActionX,ActionY,Param")
					Return True ; Verhindert die Änderung
					;Return False ; Erlaubt die Änderung
				Case $LVN_KEYDOWN ; Es wurde eine Taste gedrückt
					_WM_NOTIFY_DebugEvent("$LVN_KEYDOWN", $tagNMLVKEYDOWN, $lParam, "IDFrom,,VKey,Flags")
					; Kein Rückgabewert
				Case $NM_CLICK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der linken Maustaste anklickt
					_WM_NOTIFY_DebugEvent("$NM_CLICK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,ActionX,ActionY,lParam,KeyFlags")
					; Kein Rückgabewert
				Case $NM_DBLCLK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der linken Maustaste doppelklickt
					_WM_NOTIFY_DebugEvent("$NM_DBLCLK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,ActionX,ActionY,lParam,KeyFlags")
					; Kein Rückgabewert
				Case $NM_KILLFOCUS ; Das Control hat den Eingabefokus verloren
					_WM_NOTIFY_DebugEvent("$NM_KILLFOCUS", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
				Case $NM_RCLICK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der rechten Maustaste anklickt
					_WM_NOTIFY_DebugEvent("$NM_RCLICK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,ActionX,ActionY,lParam,KeyFlags")
					;Return 1 ; Verhindert die weitere Standard-Nachrichtenbehandlung
					Return 0 ; Erlaubt die weitere Standard-Nachrichtenbehandlung
				Case $NM_RDBLCLK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der rechten Maustaste doppelklickt
					_WM_NOTIFY_DebugEvent("$NM_RDBLCLK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,ActionX,ActionY,lParam,KeyFlags")
					; Kein Rückgabewert
				Case $NM_RETURN ; Das Control hat den Eingabefokus und der Benutzer hat die ENTER-Taste gedrückt
					_WM_NOTIFY_DebugEvent("$NM_RETURN", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
				Case $NM_SETFOCUS ; Das Control hat den Eingabefokus erhalten
					_WM_NOTIFY_DebugEvent("$NM_SETFOCUS", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
