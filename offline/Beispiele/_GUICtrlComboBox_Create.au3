; == Beispiel : mit der UDF erstellt

#include <Extras\WM_NOTIFY.au3>
#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Global $g_hCombo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("ComboBox: Erstellen (v" & @AutoItVersion & ")", 400, 296)
	$g_hCombo = _GUICtrlComboBox_Create($hGUI, "", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($g_hCombo)
	_GUICtrlComboBox_AddDir($g_hCombo, "", $DDL_DRIVES, False)
	_GUICtrlComboBox_EndUpdate($g_hCombo)

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg
	Local $hWndFrom, $iIDFrom, $iCode
	Local $hWndFrom = $lParam
	Local $iIDFrom = BitAND($wParam, 0xFFFF) ; Niederwertiges Wort
	Local $iCode = BitShift($wParam, 16) ; Höherwertiges Wort
	Switch $hWndFrom
		Case $g_hCombo
			Switch $iCode
				Case $CBN_CLOSEUP ; Gesendet, wenn die Aufklappliste einer ComboBox geschlossen wurde
					_WM_NOTIFY_DebugInfo("$CBN_CLOSEUP", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_DBLCLK ; Gesendet, wenn der Benutzer einen Doppelklick auf einen String in der Aufklappliste einer ComboBox ausgeführt hat
					_WM_NOTIFY_DebugInfo("$CBN_DBLCLK", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_DROPDOWN ; Gesendet, wenn die Aufklappliste einer ComboBox davor ist, sichtbar zu werden
					_WM_NOTIFY_DebugInfo("$CBN_DROPDOWN", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_EDITCHANGE ; Gesendet, nachdem der Benutzer eine Aktion ausgeführt hat, die möglicherweise den Text in dem Input-Control einer ComboBox geändert hat.
					_WM_NOTIFY_DebugInfo("$CBN_EDITCHANGE", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_EDITUPDATE ; Gesendet, wenn das Input-Control einer ComboBox davor ist, geänderten Text anzuzeigen.
					_WM_NOTIFY_DebugInfo("$CBN_EDITUPDATE", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_ERRSPACE ; Gesendet, wenn eine ComboBox den angeforderten Speicher nicht reservieren konnte
					_WM_NOTIFY_DebugInfo("$CBN_ERRSPACE", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_KILLFOCUS ; Gesendet, wenn die ComboBox den Fokus verloren hat
					_WM_NOTIFY_DebugInfo("$CBN_KILLFOCUS", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_SELCHANGE ; Gesendet, wenn der Benutzer die Auswahl in der Aufklappliste einer ComboBox verändert hat
					_WM_NOTIFY_DebugInfo("$CBN_SELCHANGE", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_SELENDCANCEL ; Gesendet, wenn der Benutzer ein Item auswählt, aber dann ein anderes Control auswählt oder das Dialogfenster schließt.
					_WM_NOTIFY_DebugInfo("$CBN_SELENDCANCEL", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_SELENDOK ; Gesendet, wenn der Benutzer ein Item aus der Aufklappliste auswählt, oder ein Item auswählt und dann die Aufklappliste schließt.
					_WM_NOTIFY_DebugInfo("$CBN_SELENDOK", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
				Case $CBN_SETFOCUS ; Gesendet, wenn die ComboBox den Tastatur-Fokus empfangen hat
					_WM_NOTIFY_DebugInfo("$CBN_SETFOCUS", "hWndFrom,IDFrom", $hWndFrom, $iIDFrom)
					; Kein Rückgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND
