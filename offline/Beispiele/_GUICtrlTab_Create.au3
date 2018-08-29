#include <GuiConstantsEx.au3>
#include <GuiTab.au3>
#include <WindowsConstants.au3>

Global $g_hTab

Example()

Func Example()
	Local $hGui

	; Erstellt eine GUI
	$hGui = GUICreate("Tab-Control: Erstellen (UDF)", 400, 300)
	$g_hTab = _GUICtrlTab_Create($hGui, 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($g_hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($g_hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($g_hTab, 2, "Tab 3")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndTab
	$hWndTab = $g_hTab
	If Not IsHWnd($g_hTab) Then $hWndTab = GUICtrlGetHandle($g_hTab)

	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndTab
			Switch $iCode
				Case $NM_CLICK ; Der Benutzer hat die linke Maustaste innerhalb des Controls gedrückt
					_DebugPrint("$NM_CLICK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Der Rückgabewert wird durch das Tab-Control ignoriert
				Case $NM_DBLCLK ; Der Benutzer einen Doppelklick mit der linken Maustaste innerhalb des Controls durchgeführt
					_DebugPrint("$NM_DBLCLK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Gibt 1 zurück ; Nonzero falls nicht Standard
					Return 0 ; 0 falls Standard
				Case $NM_RCLICK ; Der Benutzer hat die rechte Maustaste innerhalb des Controls gedrückt
					_DebugPrint("$NM_RCLICK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Gibt 1 zurück ; Nonzero falls nicht Standard
					Return 0 ; 0 falls Standard
				Case $NM_RDBLCLK ; Der Benutzer einen Doppelklick mit der rechten Maustaste innerhalb des Controls durchgeführt
					_DebugPrint("$NM_RDBLCLK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Gibt 1 zurück ; Nonzero falls nicht Standard
					Return 0 ; 0 falls Standard
				Case $NM_RELEASEDCAPTURE ; Das Control wurde durch die Maus erfasst
					_DebugPrint("$NM_RELEASEDCAPTURE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _DebugPrint($s_text, $sLine = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @CRLF & _
			"+======================================================" & @CRLF & _
			"-->Zeile(" & StringFormat("%04d", $sLine) & "):" & @TAB & $s_text & @CRLF & _
			"+======================================================" & @CRLF)
EndFunc   ;==>_DebugPrint
