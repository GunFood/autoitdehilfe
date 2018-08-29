#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $g_idMemo, $g_hMainGUI, $g_hStatus

Example()

Func Example()
	Local $hGui
	Local $aText[3] = ["Linksbündig", @TAB & "Zentriert", @TAB & @TAB & "Rechtsbündig"] ; Abschnittstexte
	Local $aParts[2] = [100, 175] ; Endpositionen der Abschnitte

	; Erstellt eine GUI
	$hGui = GUICreate("StatusBar: Erzeugen (Beispiel 5)", 400, 300)

	; Verwendet das längste übergebene Array (in diesem Fall ist das Text-Array das längere)
	$g_hStatus = _GUICtrlStatusBar_Create($hGui, $aParts, $aText)

	; Erstellt ein Memo-Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUICtrlSendMsg($g_idMemo, $EM_SETREADONLY, True, 0)
	GUICtrlSetBkColor($g_idMemo, 0xFFFFFF)
	GUISetState(@SW_SHOW)

	MemoWrite("StatusBar erzeugt mit:" & @CRLF & @CRLF & _
			@TAB & "Handle zum Anwendungsfenster," & @CRLF & _
			@TAB & "Abschnittsbreite als Array mit 2 Items," & @CRLF & _
			@TAB & "Abschnittstexte als Array mit 3 Items," & @CRLF)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Rändergröße ermitteln
	MemoWrite("Horizontale Randbreite ....: " & _GUICtrlStatusBar_GetBordersHorz($g_hStatus))
	MemoWrite("Vertikale Randbreite ......: " & _GUICtrlStatusBar_GetBordersVert($g_hStatus))
	MemoWrite("Breite des Rechteckrandes .: " & _GUICtrlStatusBar_GetBordersRect($g_hStatus))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUISetState(@SW_ENABLE, $g_hMainGUI)
	GUIDelete($hGui)
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR

	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Local $tinfo
	Switch $hWndFrom
		Case $g_hStatus
			Switch $iCode
				Case $NM_CLICK ; Die linke Maustaste wurde innerhalb des Controls gedrückt
					$tinfo = DllStructCreate($tagNMMOUSE, $lParam)
					$hWndFrom = HWnd(DllStructGetData($tinfo, "hWndFrom"))
					$iIDFrom = DllStructGetData($tinfo, "IDFrom")
					$iCode = DllStructGetData($tinfo, "Code")
					_DebugPrint("$NM_CLICK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->ItemSpec:" & @TAB & DllStructGetData($tinfo, "ItemSpec") & @CRLF & _
							"-->ItemData:" & @TAB & DllStructGetData($tinfo, "ItemData") & @CRLF & _
							"-->X:" & @TAB & DllStructGetData($tinfo, "X") & @CRLF & _
							"-->Y:" & @TAB & DllStructGetData($tinfo, "Y") & @CRLF & _
							"-->HitInfo:" & @TAB & DllStructGetData($tinfo, "HitInfo"))
					Return True ; Gibt an, dass der Mausklick behandelt wurde und unterdrückt die Standardverarbeitung des Ereignisses durch das System
;~ 					Return FALSE ; Erlaubt die Standardverarbeitung des Mausklicks durch das System
				Case $NM_DBLCLK ; Der Benutzer hat einen Doppelklick mit der linken Maustaste innerhalb des Controls ausgeführt
					$tinfo = DllStructCreate($tagNMMOUSE, $lParam)
					$hWndFrom = HWnd(DllStructGetData($tinfo, "hWndFrom"))
					$iIDFrom = DllStructGetData($tinfo, "IDFrom")
					$iCode = DllStructGetData($tinfo, "Code")
					_DebugPrint("$NM_DBLCLK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->ItemSpec:" & @TAB & DllStructGetData($tinfo, "ItemSpec") & @CRLF & _
							"-->ItemData:" & @TAB & DllStructGetData($tinfo, "ItemData") & @CRLF & _
							"-->X:" & @TAB & DllStructGetData($tinfo, "X") & @CRLF & _
							"-->Y:" & @TAB & DllStructGetData($tinfo, "Y") & @CRLF & _
							"-->HitInfo:" & @TAB & DllStructGetData($tinfo, "HitInfo"))
					Return True ; Gibt an, dass der Mausklick behandelt wurde und unterdrückt die Standardverarbeitung des Ereignisses durch das System
;~ 					Return FALSE ; Erlaubt die Standardverarbeitung des Mausklicks durch das System
				Case $NM_RCLICK ; Die rechte Maustaste wurde innerhalb des Controls gedrückt
					$tinfo = DllStructCreate($tagNMMOUSE, $lParam)
					$hWndFrom = HWnd(DllStructGetData($tinfo, "hWndFrom"))
					$iIDFrom = DllStructGetData($tinfo, "IDFrom")
					$iCode = DllStructGetData($tinfo, "Code")
					_DebugPrint("$NM_RCLICK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->ItemSpec:" & @TAB & DllStructGetData($tinfo, "ItemSpec") & @CRLF & _
							"-->ItemData:" & @TAB & DllStructGetData($tinfo, "ItemData") & @CRLF & _
							"-->X:" & @TAB & DllStructGetData($tinfo, "X") & @CRLF & _
							"-->Y:" & @TAB & DllStructGetData($tinfo, "Y") & @CRLF & _
							"-->HitInfo:" & @TAB & DllStructGetData($tinfo, "HitInfo"))
					Return True ; Gibt an, dass der Mausklick behandelt wurde und unterdrückt die Standardverarbeitung des Ereignisses durch das System
;~ 					Return FALSE ; Erlaubt die Standardverarbeitung des Mausklicks durch das System
				Case $NM_RDBLCLK ; Der Benutzer hat einen Doppelklick mit der rechten Maustaste innerhalb des Controls ausgeführt
					$tinfo = DllStructCreate($tagNMMOUSE, $lParam)
					$hWndFrom = HWnd(DllStructGetData($tinfo, "hWndFrom"))
					$iIDFrom = DllStructGetData($tinfo, "IDFrom")
					$iCode = DllStructGetData($tinfo, "Code")
					_DebugPrint("$NM_RDBLCLK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->ItemSpec:" & @TAB & DllStructGetData($tinfo, "ItemSpec") & @CRLF & _
							"-->ItemData:" & @TAB & DllStructGetData($tinfo, "ItemData") & @CRLF & _
							"-->X:" & @TAB & DllStructGetData($tinfo, "X") & @CRLF & _
							"-->Y:" & @TAB & DllStructGetData($tinfo, "Y") & @CRLF & _
							"-->HitInfo:" & @TAB & DllStructGetData($tinfo, "HitInfo"))
					Return True ; Gibt an, dass der Mausklick behandelt wurde und unterdrückt die Standardverarbeitung des Ereignisses durch das System
;~ 					Return FALSE ; Erlaubt die Standardverarbeitung des Mausklicks durch das System
				Case $SBN_SIMPLEMODECHANGE ; Änderung des einfachen Modus (aufgrund eines $SB_SIMPLE-Ereignisses)
					_DebugPrint("$SBN_SIMPLEMODECHANGE" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
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
