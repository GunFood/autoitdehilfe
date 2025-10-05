; == Beispiel 1 : mit Handle zu den GUI-Fenstern

#include "Extras\HelpFileInternals.au3"
#include "Extras\WM_NOTIFY.au3"

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>

Global $g_hStatus

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Erzeugen (v" & @AutoItVersion & ")", 400, 300, 100, 100)

	; Voreinstellung: nur 1 Abschnitt, ohne Text
	Local $g_hStatus = _GUICtrlStatusBar_Create($hGUI)
	$g_hStatus = $hStatus

	; Erstellt ein Memo Control
	_MemoCreate(2, 8, 444, 259)
	GUISetState(@SW_SHOW)

	Local $aParts[3] = [75, 150, -1]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	_MemoWrite("StatusBar erstellt mit:" & @CRLF & _
			@TAB & "Handle zum GUI Fenster" & @CRLF)

	_WM_NOTIFY_Register($_g_idLst_Memo)

	; Ermittelt die Randbreite
	_MemoWrite("Horizontale Randbreite ....: " & _GUICtrlStatusBar_GetBordersHorz($g_hStatus))
	_MemoWrite("Vertikale Randbreite ......: " & _GUICtrlStatusBar_GetBordersVert($g_hStatus))
	_MemoWrite("Breite des Rechteckrandes .: " & _GUICtrlStatusBar_GetBordersRect($g_hStatus))
	_MemoWrite("")

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete($)
EndFunc   ;==>Example

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
