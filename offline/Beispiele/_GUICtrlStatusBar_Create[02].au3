; == Beispiel 2 : Abschnittsbreiten in einem Array von 3 Elementen

#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <Extras\WM_NOTIFY.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $g_idMemo, $g_hMainGUI, $g_hStatus

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Erzeugen (v" & @AutoItVersion & ")", 400, 300)

	; Nur die Abschnitte, keinen Text festlegen
	Local $aParts[3] = [75, 150, -1]
	$g_hStatus = _GUICtrlStatusBar_Create($hGUI, $aParts)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUICtrlSendMsg($g_idMemo, $EM_SETREADONLY, True, 0)
	GUICtrlSetBkColor($g_idMemo, 0xFFFFFF)
	GUISetState(@SW_SHOW)

	MemoWrite("StatusBar erzeugt mit:" & @CRLF & _
			@TAB & "Handle zum Anwendungsfenster," & @CRLF & _
			@TAB & "Abschnittsbreite als Array mit 3 Items," & @CRLF)

	_WM_NOTIFY_Register($g_idMemo)

	; Rändergröße ermitteln
	MemoWrite("Horizontale Randbreite ....: " & _GUICtrlStatusBar_GetBordersHorz($g_hStatus))
	MemoWrite("Vertikale Randbreite ......: " & _GUICtrlStatusBar_GetBordersVert($g_hStatus))
	MemoWrite("Breite des Rechteckrandes .: " & _GUICtrlStatusBar_GetBordersRect($g_hStatus))
	MemoWrite("")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUISetState(@SW_ENABLE, $g_hMainGUI)
	GUIDelete($hGUI)
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	Local $iCode = DllStructGetData($tNMHDR, "Code")
	Local $tinfo
	Switch $hWndFrom
		Case $g_hStatus
			Switch $iCode
				Case $NM_CLICK ; Die linke Maustaste wurde innerhalb des Controls gedrückt
					_WM_NOTIFY_DebugEvent("$NM_CLICK", $tagNMMOUSE, $lParam, "IDFrom,,ItemSpec,ItemData,X,Y,HitInfo")
					Return True ; Gibt an, dass der Mausklick behandelt wurde und unterdrückt die Standardverarbeitung des Ereignisses durch das System
;~ 					Return FALSE ; Erlaubt die Standardverarbeitung des Mausklicks durch das System
				Case $NM_DBLCLK ; Der Benutzer hat einen Doppelklick mit der linken Maustaste innerhalb des Controls ausgeführt
					_WM_NOTIFY_DebugEvent("$NM_DBLCLK", $tagNMMOUSE, $lParam, "IDFrom,,ItemSpec,ItemData,X,Y,HitInfo")
					Return True ; Gibt an, dass der Mausklick behandelt wurde und unterdrückt die Standardverarbeitung des Ereignisses durch das System
;~ 					Return FALSE ; Erlaubt die Standardverarbeitung des Mausklicks durch das System
				Case $NM_RCLICK ; Die rechte Maustaste wurde innerhalb des Controls gedrückt
					_WM_NOTIFY_DebugEvent("$NM_RCLICK", $tagNMMOUSE, $lParam, "IDFrom,,ItemSpec,ItemData,X,Y,HitInfo")
					Return True ; Gibt an, dass der Mausklick behandelt wurde und unterdrückt die Standardverarbeitung des Ereignisses durch das System
;~ 					Return FALSE ; Erlaubt die Standardverarbeitung des Mausklicks durch das System
				Case $NM_RDBLCLK ; Der Benutzer hat einen Doppelklick mit der rechten Maustaste innerhalb des Controls ausgeführt
					_WM_NOTIFY_DebugEvent("$NM_RDBLCLK", $tagNMMOUSE, $lParam, "IDFrom,,ItemSpec,ItemData,X,Y,HitInfo")
					Return True ; Gibt an, dass der Mausklick behandelt wurde und unterdrückt die Standardverarbeitung des Ereignisses durch das System
;~ 					Return FALSE ; Erlaubt die Standardverarbeitung des Mausklicks durch das System
				Case $SBN_SIMPLEMODECHANGE ; Änderung des einfachen Modus (aufgrund eines $SB_SIMPLE-Ereignisses)
					_WM_NOTIFY_DebugEvent("$SBN_SIMPLEMODECHANGE", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
