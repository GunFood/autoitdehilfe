#include <Extras\WM_NOTIFY.au3>
#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_idCombo

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("ComboBox: Auto-Vervollständigen (v" & @AutoItVersion & ")", 400, 296)
	$g_idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($g_idCombo)
	_GUICtrlComboBox_AddDir($g_idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($g_idCombo)

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func _Edit_Changed()
	_GUICtrlComboBox_AutoComplete($g_idCombo)
EndFunc   ;==>_Edit_Changed

Func WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg
	Local $hWndCombo = $g_idCombo
	If Not IsHWnd($g_idCombo) Then $hWndCombo = GUICtrlGetHandle($g_idCombo)
	Local $hWndFrom = $lParam
	Local $iIDFrom = BitAND($wParam, 0xFFFF) ; Low Word
	Local $iCode = BitShift($wParam, 16) ; Hi Word
	Switch $hWndFrom
		Case $g_idCombo, $hWndCombo
			Switch $iCode
				Case $CBN_CLOSEUP ; Wird gesendet, wenn die ListBox der ComboBox geschlossen wurde
					_WM_NOTIFY_DebugInfo("$CBN_CLOSEUP", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_DBLCLK ; Wird gesendet, wenn der Benutzer einen Doppelklick auf einen String in der ListBox einer ComboBox ausführt
					_WM_NOTIFY_DebugInfo("$CBN_DBLCLK", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_DROPDOWN ; Wird gesendet, wenn die ListBox einer ComboBox sichtbar wird
					_WM_NOTIFY_DebugInfo("$CBN_DROPDOWN", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_EDITCHANGE ; Wird gesendet, nachdem ein Benutzer eine Aktion durchgeführt hat, die den Text im Edit-Control der ComboBox verändert hat
					_WM_NOTIFY_DebugInfo("$CBN_EDITCHANGE", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					_Edit_Changed()
					; Kein Rückgabewert
				Case $CBN_EDITUPDATE ; Wird gesendet, wenn das Edit-Control der ComboBox geänderten Text anzeigt
					_WM_NOTIFY_DebugInfo("$CBN_EDITUPDATE", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_ERRSPACE ; Wird gesendet, wenn der ComboBox nicht genug Speicher zur Verfügung gestellt wird, um die Anfrage zu bearbeiten
					_WM_NOTIFY_DebugInfo("$CBN_ERRSPACE", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_KILLFOCUS ; Wird gesendet, wenn die ComboBox den Fokus verloren hat
					_WM_NOTIFY_DebugInfo("$CBN_KILLFOCUS", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_SELCHANGE ; Wird gesendet, wenn der Benutzer die Auswahl in der ListBox einer ComboBox verändert hat
					_WM_NOTIFY_DebugInfo("$CBN_SELCHANGE", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_SELENDCANCEL ; Wird gesendet, wenn der Benutzer ein Item auswählt und danach ein anderes Control auswählt oder die Dialog-Box schließt
					_WM_NOTIFY_DebugInfo("$CBN_SELENDCANCEL", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_SELENDOK ; Wird gesendet, wenn der Benutzer ein List-Item auswählt oder ein Item auswählt und dann die Liste schließt
					_WM_NOTIFY_DebugInfo("$CBN_SELENDOK", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_SETFOCUS ; Wird gesendet, wenn die ComboBox den Tastatur-Fokus empfängt
					_WM_NOTIFY_DebugInfo("$CBN_SETFOCUS", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND
