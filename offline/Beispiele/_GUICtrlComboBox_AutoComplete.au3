#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_idCombo

Example()

Func Example()

	; Erstellt eine GUI
	GUICreate("ComboBox: Auto-Vervollständigen", 400, 296)
	$g_idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($g_idCombo)
	_GUICtrlComboBox_AddDir($g_idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($g_idCombo)

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func _Edit_Changed()
	_GUICtrlComboBox_AutoComplete($g_idCombo)
EndFunc   ;==>_Edit_Changed

Func WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg
	Local $hWndFrom, $iIDFrom, $iCode, $hWndCombo
	If Not IsHWnd($g_idCombo) Then $hWndCombo = GUICtrlGetHandle($g_idCombo)
	$hWndFrom = $lParam
	$iIDFrom = BitAND($wParam, 0xFFFF) ; Low Word
	$iCode = BitShift($wParam, 16) ; Hi Word
	Switch $hWndFrom
		Case $g_idCombo, $hWndCombo
			Switch $iCode
				Case $CBN_CLOSEUP ; Wird gesendet, wenn die ListBox der ComboBox geschlossen wurde
					_DebugPrint("$CBN_CLOSEUP" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_DBLCLK ; Wird gesendet, wenn der Benutzer einen Doppelklick auf einen String in der ListBox einer ComboBox ausführt
					_DebugPrint("$CBN_DBLCLK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_DROPDOWN ; Wird gesendet, wenn die ListBox einer ComboBox sichtbar wird
					_DebugPrint("$CBN_DROPDOWN" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_EDITCHANGE ; Wird gesendet, nachdem ein Benutzer eine Aktion durchgeführt hat, die den Text im Edit-Control der ComboBox verändert hat
					_DebugPrint("$CBN_EDITCHANGE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					_Edit_Changed()
					; Kein Rückgabewert
				Case $CBN_EDITUPDATE ; Wird gesendet, wenn das Edit-Control der ComboBox geänderten Text anzeigt
					_DebugPrint("$CBN_EDITUPDATE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_ERRSPACE ; Wird gesendet, wenn der ComboBox nicht genug Speicher zur Verfügung gestellt wird, um die Anfrage zu bearbeiten
					_DebugPrint("$CBN_ERRSPACE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_KILLFOCUS ; Wird gesendet, wenn die ComboBox den Fokus verloren hat
					_DebugPrint("$CBN_KILLFOCUS" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_SELCHANGE ; Wird gesendet, wenn der Benutzer die Auswahl in der ListBox einer ComboBox verändert hat
					_DebugPrint("$CBN_SELCHANGE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_SELENDCANCEL ; Wird gesendet, wenn der Benutzer ein Item auswählt und danach ein anderes Control auswählt oder die Dialog-Box schließt
					_DebugPrint("$CBN_SELENDCANCEL" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_SELENDOK ; Wird gesendet, wenn der Benutzer ein List-Item auswählt oder ein Item auswählt und dann die Liste schließt
					_DebugPrint("$CBN_SELENDOK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $CBN_SETFOCUS ; Wird gesendet, wenn die ComboBox den Tastatur-Fokus empfängt
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
