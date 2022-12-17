; == Beispiel : mit der UDF erstellt

#include <Extras\WM_NOTIFY.au3>
#include <GuiConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>

Global $g_hTreeView

Example()

Func Example()
	Local $hGUI = GUICreate("TreeView: Erstellen (v" & @AutoItVersion & ")", 400, 300)
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	$g_hTreeView = _GUICtrlTreeView_Create($hGUI, 2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_WM_NOTIFY_Register()

	_GUICtrlTreeView_BeginUpdate($g_hTreeView)
	Local $hItem
	For $x = 0 To 5
		$ahItem = _GUICtrlTreeView_Add($g_hTreeView, 0, StringFormat("[%02d] Neues Item", $x))
		For $y = 0 To 3
			_GUICtrlTreeView_AddChild($g_hTreeView, $ahItem, StringFormat("[%02d] Neues Child", $y))
		Next
	Next
	_GUICtrlTreeView_EndUpdate($g_hTreeView)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndTreeview = $g_hTreeView
	If Not IsHWnd($g_hTreeView) Then $hWndTreeview = GUICtrlGetHandle($g_hTreeView)

	Local $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	Local $iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndTreeview
			Switch $iCode
				Case $NM_CLICK ; Der Benutzer hat das Control mit der linken Maustaste angeklickt
					_WM_NOTIFY_DebugEvent("$NM_CLICK", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
;~ 					Return 1 ; Verhindert die Standard-Nachrichtenbehandlung
					Return 0 ; Standard-Nachrichtenbehandlung wird ausgeführt
				Case $NM_DBLCLK ; Der Benutzer hat einen Doppelklick auf das Control ausgeführt
					_WM_NOTIFY_DebugEvent("$NM_DBLCLK", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
;~ 					Return 1 ; Verhindert die Standard-Nachrichtenbehandlung
					Return 0 ; Standard-Nachrichtenbehandlung wird ausgeführt
				Case $NM_RCLICK ; Der Benutzer hat das Control mit der rechten Maustaste angeklickt
					_WM_NOTIFY_DebugEvent("$NM_RCLICK", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
;~ 					Return 1 ; Verhindert die Standard-Nachrichtenbehandlung
					Return 0 ; Standard-Nachrichtenbehandlung wird ausgeführt
				Case $NM_RDBLCLK ; Der Benutzer hat das Control mit der rechten Maustaste doppelgeklickt
					_WM_NOTIFY_DebugEvent("$NM_RDBLCLK", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
;~ 					Return 1 ; Verhindert die Standard-Nachrichtenbehandlung
					Return 0 ; Standard-Nachrichtenbehandlung wird ausgeführt
				Case $NM_KILLFOCUS ; Das Control hat den Eingabefokus verloren
					_WM_NOTIFY_DebugEvent("$NM_KILLFOCUS", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
				Case $NM_RETURN ; Das Control hat den Eingabefokus und der Benutzer hat eine Taste gedrückt
					_WM_NOTIFY_DebugEvent("$NM_RETURN", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
;~ 					Return 1 ; Verhindert die Standard-Nachrichtenbehandlung
					Return 0 ; Standard-Nachrichtenbehandlung wird ausgeführt
;~ 				Case $NM_SETCURSOR ; Das Control setzt den Cursor, weil es eine WM_SETCURSOR-Nachricht erhalten hat
;~ 					_WM_NOTIFY_DebugEvent("$NM_SETCURSOR", $tagNMMOUSE, $lParam, "IDFrom,,ItemSpec,ItemData,X,Y,HitInfo")
;~ 					Return 0 ; Erlaubt dem Control, den Cursor zu setzen
;~					Return 1 ; Verbietet dem Control, den Cursor zu setzen
				Case $NM_SETFOCUS ; Das Control hat den Eingabefokus erhalten
					_WM_NOTIFY_DebugEvent("$NM_SETFOCUS", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
				Case $TVN_BEGINDRAGA, $TVN_BEGINDRAGW
					_WM_NOTIFY_DebugEvent("$TVN_BEGINDRAG", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
				Case $TVN_BEGINLABELEDITA, $TVN_BEGINLABELEDITW
					_WM_NOTIFY_DebugEvent("$TVN_BEGINLABELEDIT", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
				Case $TVN_BEGINRDRAGA, $TVN_BEGINRDRAGW
					_WM_NOTIFY_DebugEvent("$TVN_BEGINRDRAG", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
				Case $TVN_DELETEITEMA, $TVN_DELETEITEMW
					_WM_NOTIFY_DebugEvent("$TVN_DELETEITEM", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
				Case $TVN_ENDLABELEDITA, $TVN_ENDLABELEDITW
					_WM_NOTIFY_DebugEvent("$TVN_ENDLABELEDIT", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
				Case $TVN_GETDISPINFOA, $TVN_GETDISPINFOW
					_WM_NOTIFY_DebugEvent("$TVN_GETDISPINFO", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
				Case $TVN_GETINFOTIPA, $TVN_GETINFOTIPW
					_WM_NOTIFY_DebugEvent("$TVN_GETINFOTIP", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
				Case $TVN_ITEMEXPANDEDA, $TVN_ITEMEXPANDEDW
					_WM_NOTIFY_DebugEvent("$TVN_ITEMEXPANDED", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
				Case $TVN_ITEMEXPANDINGA, $TVN_ITEMEXPANDINGW
					_WM_NOTIFY_DebugEvent("$TVN_ITEMEXPANDING", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
				Case $TVN_KEYDOWN
					_WM_NOTIFY_DebugEvent("$TVN_KEYDOWN", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
				Case $TVN_SELCHANGEDA, $TVN_SELCHANGEDW
					_WM_NOTIFY_DebugEvent("$TVN_SELCHANGED", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
				Case $TVN_SELCHANGINGA, $TVN_SELCHANGINGW
					_WM_NOTIFY_DebugEvent("$TVN_SELCHANGING", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
				Case $TVN_SETDISPINFOA, $TVN_SETDISPINFOW
					_WM_NOTIFY_DebugEvent("$TVN_SETDISPINFO", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
				Case $TVN_SINGLEEXPAND
					_WM_NOTIFY_DebugEvent("$TVN_SINGLEEXPAND", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY