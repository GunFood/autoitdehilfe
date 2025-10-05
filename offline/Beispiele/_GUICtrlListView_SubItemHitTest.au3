#include "Extras\WM_NOTIFY.au3"

#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <GuiStatusBar.au3>
#include <StructureConstants.au3>
#include <WindowsNotifsConstants.au3>

Global $g_idListView, $g_hStatusBar, $g_iIndex = -1, $g_iSubIndex = -1

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("ListView: Ermittelt, welches Listview Item oder Subitem sich an einer gegebenen Position befindet (v" & @AutoItVersion & ")", 700, 300)
	$g_idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	$g_idListView = GUICtrlGetHandle($g_idListView) ; Handle ermitteln, das für die Benachrichtigungsereingnisse benutzt wird
	$g_hStatusBar = _GUICtrlStatusBar_Create($hGUI, -1, "")

	; Aktiviert erweiterte Control-Stile
	_GUICtrlListView_SetExtendedListViewStyle($g_idListView, $LVS_EX_SUBITEMIMAGES)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlListView_SetUnicodeFormat($g_idListView, False)

	_WM_NOTIFY_Register()

	; Lädt die Bilder
	Local $hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($g_idListView, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($g_idListView, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($g_idListView, 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($g_idListView, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($g_idListView, "Spalte 1", 120)
	_GUICtrlListView_AddColumn($g_idListView, "Spalte 2", 120)
	_GUICtrlListView_AddColumn($g_idListView, "Spalte 3", 120)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($g_idListView, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($g_idListView, 0, "Zeile 1: Spalte 2", 1, 1)
	_GUICtrlListView_AddSubItem($g_idListView, 0, "Zeile 1: Spalte 3", 2, 2)
	_GUICtrlListView_AddItem($g_idListView, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($g_idListView, 1, "Zeile 2: Spalte 2", 1, 2)
	_GUICtrlListView_AddItem($g_idListView, "Zeile 3: Spalte 1", 2)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func ListView_Click()
	Local $aHit = _GUICtrlListView_SubItemHitTest($g_idListView)
	If ($aHit[0] <> -1) And (($aHit[0] <> $g_iIndex) Or ($aHit[1] <> $g_iSubIndex)) Then
		_GUICtrlStatusBar_SetText($g_hStatusBar, @TAB & StringFormat("HitTest Item: %d, SubItem: %d", $aHit[0], $aHit[1]))
		$g_iIndex = $aHit[0]
		$g_iSubIndex = $aHit[1]
	EndIf
EndFunc   ;==>ListView_Click

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndListView, $tInfo
	Local $hWndListView = $g_idListView
	If Not IsHWnd($g_idListView) Then $hWndListView = GUICtrlGetHandle($g_idListView)

	Local $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	Local $iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndListView
			Switch $iCode
				Case $LVN_COLUMNCLICK ; Es wurde auf eine Spalte geklickt
					$tInfo = DllStructCreate($tagNMLISTVIEW, $lParam)
					_WM_NOTIFY_DebugEvent("$LVN_COLUMNCLICK", $tagNMLISTVIEW, $lParam, "IDFrom,,Item,SubItem,NewState,OldState,Changed,ActionX,ActionY,Param")
					; Kein Rückgabewert
				Case $LVN_KEYDOWN ; Es wurde eine Taste gedrückt
					_WM_NOTIFY_DebugEvent("$LVN_KEYDOWN", $tagNMLVKEYDOWN, $lParam, "IDFrom,,VKey,Flags")
					; Kein Rückgabewert
				Case $NM_CLICK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der linken Maustaste anklickt
					_WM_NOTIFY_DebugEvent("$NM_CLICK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,X,Y,lParam,KeyFlags")
					ListView_Click()
					; Kein Rückgabewert
				Case $NM_DBLCLK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der linken Maustaste doppelklickt
					_WM_NOTIFY_DebugEvent("$NM_DBLCLK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,X,Y,lParam,KeyFlags")
					; Kein Rückgabewert
				Case $NM_KILLFOCUS ; Das Control hat den Eingabefokus verloren
					_WM_NOTIFY_DebugEvent("$NM_KILLFOCUS", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
				Case $NM_RCLICK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der rechten Maustaste anklickt
					_WM_NOTIFY_DebugEvent("$NM_RCLICK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,X,Y,lParam,KeyFlags")
					;Return 1 ; Verhindert die weitere Standard-Nachrichtenbehandlung
					Return 0 ; Erlaubt die weitere Standard-Nachrichtenbehandlung
				Case $NM_RDBLCLK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der rechten Maustaste doppelklickt
					_WM_NOTIFY_DebugEvent("$NM_RDBLCLK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,X,Y,lParam,KeyFlags")
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
