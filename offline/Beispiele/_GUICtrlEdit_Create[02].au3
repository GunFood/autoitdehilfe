#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <WinAPIConv.au3>
#include <WindowsConstants.au3>

Global $g_hEdit

_Example2()

Func _Example2()
	Local $hGui

	; Erstellt eine GUI
	$hGui = GUICreate("Edit: Erstellen", 400, 300)
	$g_hEdit = _GUICtrlEdit_Create($hGui, "", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")

	_GUICtrlEdit_SetText($g_hEdit, "Dies ist ein Test" & @CRLF & "Noch eine Zeile")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Example2

Func WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg
	Local $hWndFrom, $iIDFrom, $iCode, $hWndEdit
	If Not IsHWnd($g_hEdit) Then $hWndEdit = GUICtrlGetHandle($g_hEdit)
	$hWndFrom = $lParam
	$iIDFrom = _WinAPI_LoWord($wParam)
	$iCode = _WinAPI_HiWord($wParam)
	Switch $hWndFrom
		Case $g_hEdit, $hWndEdit
			Switch $iCode
				Case $EN_ALIGN_LTR_EC ; Gesendet, wenn der Benutzer die Textausrichtung im Input-Control zu Links nach Rechts gewechselt hat
					_DebugPrint("$EN_ALIGN_LTR_EC" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $EN_ALIGN_RTL_EC ; Gesendet, wenn der Benutzer die Textausrichtung im Input-Control zu Rechts nach Links gewechselt hat
					_DebugPrint("$EN_ALIGN_RTL_EC" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $EN_CHANGE ; Gesendet, wenn der Benutzer eine Aktion ausgeführt hat, die möglicherweise Text im Input-Control geändert hat
					_DebugPrint("$EN_CHANGE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $EN_ERRSPACE ; Gesendet, wenn ein Input-Control nicht genug Speicher reservieren konnte, um der Anforderung dessen zu entsprechen
					_DebugPrint("$EN_ERRSPACE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $EN_HSCROLL ; Gesendet, wenn der Benutzer auf die horizontale Scrollbar des Input-Controls klickt
					_DebugPrint("$EN_HSCROLL" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $EN_KILLFOCUS ; Gesendet, wenn ein Input-Control den Tastaturfokus verliert
					_DebugPrint("$EN_KILLFOCUS" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $EN_MAXTEXT ; Gesendet, wenn das aktuelle Einfügen von Text die festgelegte Anzahl von Zeichen für das Input-Control überschritten hat
					_DebugPrint("$EN_MAXTEXT" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Diese Nachricht wird ebenso gesendet, wenn ein Input-Control nicht den Stil $ES_AUTOHSCROLL besitzt und die Anzahl der einzufügenden
					; Zeichen die Breite des Input-Controls überschreitet.
					; Diese Nachricht wird ebenso gesendet, wenn ein Input-Control nicht den Stil $ES_AUTOHSCROLL besitzt und die gesamte Anzahl der Zeilen,
					; Die aus einer Texteinfügung resultieren, die Höhe des Input-Controls überschreitet.

					; Kein Rückgabewert
				Case $EN_SETFOCUS ; Gesendet, wenn ein Input-Control den Tastaturfokus erhält
					_DebugPrint("$EN_SETFOCUS" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $EN_UPDATE ; Gesendet, wenn ein Input-Control davor ist, sich zu neuzuzeichnen
					_DebugPrint("$EN_UPDATE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $EN_VSCROLL ; Gesendet, wenn der Benutzer auf die vertikale Scrollbar des Input-Controls klickt oder wenn der Benutzer das Mausrad über dem Input-Control rollt
					_DebugPrint("$EN_VSCROLL" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND

Func _DebugPrint($s_text, $sLine = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @CRLF & _
			"+======================================================" & @CRLF & _
			"-->Zeile(" & StringFormat("%04d", $sLine) & "):" & @TAB & $s_text & @CRLF & _
			"+======================================================" & @CRLF)
EndFunc   ;==>_DebugPrint
