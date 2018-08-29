#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Global $g_hCombo

Example()

Func Example()
	Local $hGui

	; Erstellt eine GUI
	$hGui = GUICreate("(UDF) ComboBox: Erstellen", 400, 296)
	$g_hCombo = _GUICtrlComboBox_Create($hGui, "", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($g_hCombo)
	_GUICtrlComboBox_AddDir($g_hCombo, "", $DDL_DRIVES, False)
	_GUICtrlComboBox_EndUpdate($g_hCombo)

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg
	Local $hWndFrom, $iIDFrom, $iCode
	$hWndFrom = $lParam
	$iIDFrom = BitAND($wParam, 0xFFFF) ; Niederwertiges Wort
	$iCode = BitShift($wParam, 16) ; Höherwertiges Wort
	Switch $hWndFrom
		Case $g_hCombo
			Switch $iCode
				Case $CBN_CLOSEUP ; Gesendet, wenn die Aufklappliste einer ComboBox geschlossen wurde
					_DebugPrint("$CBN_CLOSEUP" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_DBLCLK ; Gesendet, wenn der Benutzer einen Doppelklick auf einen String in der Aufklappliste einer ComboBox ausgeführt hat
					_DebugPrint("$CBN_DBLCLK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_DROPDOWN ; Gesendet, wenn die Aufklappliste einer ComboBox davor ist, sichtbar zu werden
					_DebugPrint("$CBN_DROPDOWN" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_EDITCHANGE ; Gesendet, nachdem der Benutzer eine Aktion ausgeführt hat, die möglicherweise den Text in dem Input-Control einer ComboBox geändert hat.
					_DebugPrint("$CBN_EDITCHANGE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_EDITUPDATE ; Gesendet, wenn das Input-Control einer ComboBox davor ist, geänderten Text anzuzeigen.
					_DebugPrint("$CBN_EDITUPDATE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_ERRSPACE ; Gesendet, wenn eine ComboBox den angeforderten Speicher nicht reservieren konnte
					_DebugPrint("$CBN_ERRSPACE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_KILLFOCUS ; Gesendet, wenn die ComboBox den Fokus verloren hat
					_DebugPrint("$CBN_KILLFOCUS" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_SELCHANGE ; Gesendet, wenn der Benutzer die Auswahl in der Aufklappliste einer ComboBox verändert hat
					_DebugPrint("$CBN_SELCHANGE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_SELENDCANCEL ; Gesendet, wenn der Benutzer ein Item auswählt, aber dann ein anderes Control auswählt oder das Dialogfenster schließt.
					_DebugPrint("$CBN_SELENDCANCEL" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_SELENDOK ; Gesendet, wenn der Benutzer ein Item aus der Aufklappliste auswählt, oder ein Item auswählt und dann die Aufklappliste schließt.
					_DebugPrint("$CBN_SELENDOK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_SETFOCUS ; Gesendet, wenn die ComboBox den Tastatur-Fokus empfangen hat
					_DebugPrint("$CBN_SETFOCUS" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
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
