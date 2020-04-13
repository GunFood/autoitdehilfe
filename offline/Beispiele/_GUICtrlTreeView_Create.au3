#include <GuiConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>

Global $g_hTreeView

Example()

Func Example()
	Local $hGUI, $ahItem
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	$hGUI = GUICreate("TreeView: Erstellen (UDF)", 400, 300)

	$g_hTreeView = _GUICtrlTreeView_Create($hGUI, 2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	_GUICtrlTreeView_BeginUpdate($g_hTreeView)
	For $x = 1 To Random(2, 10, 1)
		$ahItem = _GUICtrlTreeView_Add($g_hTreeView, 0, StringFormat("[%02d] Neues Item", $x))
		For $y = 1 To Random(2, 10, 1)
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
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndTreeview
	$hWndTreeview = $g_hTreeView
	If Not IsHWnd($g_hTreeView) Then $hWndTreeview = GUICtrlGetHandle($g_hTreeView)

	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndTreeview
			Switch $iCode
				Case $NM_CLICK ; Der Benutzer hat das Control mit der linken Maustaste angeklickt
					_DebugPrint("$NM_CLICK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Return 1 ; Verhindert die Standard-Nachrichtenbehandlung
					Return 0 ; Standard-Nachrichtenbehandlung wird ausgeführt
				Case $NM_DBLCLK ; Der Benutzer hat einen Doppelklick auf das Control ausgeführt
					_DebugPrint("$NM_DBLCLK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Return 1 ; Verhindert die Standard-Nachrichtenbehandlung
					Return 0 ; Standard-Nachrichtenbehandlung wird ausgeführt
				Case $NM_RCLICK ; Der Benutzer hat das Control mit der rechten Maustaste angeklickt
					_DebugPrint("$NM_RCLICK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Return 1 ; Verhindert die Standard-Nachrichtenbehandlung
					Return 0 ; Standard-Nachrichtenbehandlung wird ausgeführt
				Case $NM_RDBLCLK ; Der Benutzer hat das Control mit der rechten Maustaste doppelgeklickt
					_DebugPrint("$NM_RDBLCLK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Return 1 ; Verhindert die Standard-Nachrichtenbehandlung
					Return 0 ; Standard-Nachrichtenbehandlung wird ausgeführt
				Case $NM_KILLFOCUS ; Das Control hat den Eingabefokus verloren
					_DebugPrint("$NM_KILLFOCUS" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $NM_RETURN ; Das Control hat den Eingabefokus und der Benutzer hat eine Taste gedrückt
					_DebugPrint("$NM_RETURN" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Return 1 ; Verhindert die Standard-Nachrichtenbehandlung
					Return 0 ; Standard-Nachrichtenbehandlung wird ausgeführt
;~ 				Case $NM_SETCURSOR ; Das Control setzt den Cursor, weil es eine WM_SETCURSOR-Nachricht erhalten hat
;~ 					Local $tinfo = DllStructCreate($tagNMMOUSE, $lParam)
;~ 					$hWndFrom = HWnd(DllStructGetData($tinfo, "hWndFrom"))
;~ 					$iIDFrom = DllStructGetData($tinfo, "IDFrom")
;~ 					$iCode = DllStructGetData($tinfo, "Code")
;~ 					_DebugPrint("$NM_SETCURSOR" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode & @CRLF & _
;~ 							"-->ItemSpec:" & @TAB & DllStructGetData($tinfo, "ItemSpec") & @CRLF & _
;~ 							"-->ItemData:" & @TAB & DllStructGetData($tinfo, "ItemData") & @CRLF & _
;~ 							"-->X:" & @TAB & DllStructGetData($tinfo, "X") & @CRLF & _
;~ 							"-->Y:" & @TAB & DllStructGetData($tinfo, "Y") & @CRLF & _
;~ 							"-->HitInfo:" & @TAB & DllStructGetData($tinfo, "HitInfo"))
;~ 					Return 0 ; Erlaubt dem Control, den Cursor zu setzen
;~					Return 1 ; Verbietet dem Control, den Cursor zu setzen
				Case $NM_SETFOCUS ; Das Control hat den Eingabefokus erhalten
					_DebugPrint("$NM_SETFOCUS" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $TVN_BEGINDRAGA, $TVN_BEGINDRAGW
					_DebugPrint("$TVN_BEGINDRAG")
				Case $TVN_BEGINLABELEDITA, $TVN_BEGINLABELEDITW
					_DebugPrint("$TVN_BEGINLABELEDIT")
				Case $TVN_BEGINRDRAGA, $TVN_BEGINRDRAGW
					_DebugPrint("$TVN_BEGINRDRAG")
				Case $TVN_DELETEITEMA, $TVN_DELETEITEMW
					_DebugPrint("$TVN_DELETEITEM")
				Case $TVN_ENDLABELEDITA, $TVN_ENDLABELEDITW
					_DebugPrint("$TVN_ENDLABELEDIT")
				Case $TVN_GETDISPINFOA, $TVN_GETDISPINFOW
					_DebugPrint("$TVN_GETDISPINFO")
				Case $TVN_GETINFOTIPA, $TVN_GETINFOTIPW
					_DebugPrint("$TVN_GETINFOTIP")
				Case $TVN_ITEMEXPANDEDA, $TVN_ITEMEXPANDEDW
					_DebugPrint("$TVN_ITEMEXPANDED")
				Case $TVN_ITEMEXPANDINGA, $TVN_ITEMEXPANDINGW
					_DebugPrint("$TVN_ITEMEXPANDING")
				Case $TVN_KEYDOWN
					_DebugPrint("$TVN_KEYDOWN")
				Case $TVN_SELCHANGEDA, $TVN_SELCHANGEDW
					_DebugPrint("$TVN_SELCHANGED")
				Case $TVN_SELCHANGINGA, $TVN_SELCHANGINGW
					_DebugPrint("$TVN_SELCHANGING")
				Case $TVN_SETDISPINFOA, $TVN_SETDISPINFOW
					_DebugPrint("$TVN_SETDISPINFO")
				Case $TVN_SINGLEEXPAND
					_DebugPrint("$TVN_SINGLEEXPAND")
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _DebugPrint($s_text, $sLine = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @CRLF & _
			"+======================================================" & @CRLF & _
			"-->Zeile (" & StringFormat("%03d", $sLine) & "):" & @TAB & $s_text & @CRLF & _
			"+======================================================" & @CRLF)
EndFunc   ;==>_DebugPrint
