#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Global $g_hListBox

Example()

Func Example()
	Local $hGui

	; Erstellt eine GUI
	$hGui = GUICreate("(UDF) ListBox: Erzeugen", 400, 296)
	$g_hListBox = _GUICtrlListBox_Create($hGui, "String bei Erzeugung", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	MsgBox($MB_SYSTEMMODAL, "Information", "Hinzufügen von Items")

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")

	; Fügt Dateien hinzu
	_GUICtrlListBox_BeginUpdate($g_hListBox)
	_GUICtrlListBox_ResetContent($g_hListBox)
	_GUICtrlListBox_InitStorage($g_hListBox, 100, 4096)
	_GUICtrlListBox_Dir($g_hListBox, @WindowsDir & "\win*.exe")
	_GUICtrlListBox_AddFile($g_hListBox, @WindowsDir & "\notepad.exe")
	_GUICtrlListBox_Dir($g_hListBox, "", $DDL_DRIVES)
	_GUICtrlListBox_Dir($g_hListBox, "", $DDL_DRIVES, False)
	_GUICtrlListBox_EndUpdate($g_hListBox)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

Func WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg
	Local $hWndFrom, $iIDFrom, $iCode, $hWndListBox
	If Not IsHWnd($g_hListBox) Then $hWndListBox = GUICtrlGetHandle($g_hListBox)
	$hWndFrom = $lParam
	$iIDFrom = BitAND($wParam, 0xFFFF) ; Niederwertiges Wort (WORD)
	$iCode = BitShift($wParam, 16) ; Höherwertiges Wort (WORD)

	Switch $hWndFrom
		Case $g_hListBox, $hWndListBox
			Switch $iCode
				Case $LBN_DBLCLK ; Wird gesendet, wenn der Benutzer einen Doppelklick auf einen String in einer ListBox ausführt
					_DebugPrint("$LBN_DBLCLK" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $LBN_ERRSPACE ; Wird gesendet, wenn eine ListBox nicht genug Speicher zugeteilt bekommt, um eine Anfrage entgegenzunehmen
					_DebugPrint("$LBN_ERRSPACE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $LBN_KILLFOCUS ; Wird gesendet, wenn eine ListBox den Tastatur-Fokus verliert
					_DebugPrint("$LBN_KILLFOCUS" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $LBN_SELCANCEL ; Wird gesendet, wenn der Benutzer die Auswahl in einer ListBox abbricht
					_DebugPrint("$LBN_SELCANCEL" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $LBN_SELCHANGE ; Wird gesendet, wenn die Auswahl in einer ListBox geändert wurde
					_DebugPrint("$LBN_SELCHANGE" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $LBN_SETFOCUS ; Wird gesendet, wenn eine Listbox den Tastatur-Fokus erhält
					_DebugPrint("$LBN_SETFOCUS" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
			EndSwitch
	EndSwitch
	; Die internen Standard Autoit3-Messages-Befehle werden fortgesetzt.
	; Die ganze Zeile kann auch weggelassen werden.
	; !!! Aber wird nur 'Return' (ohne Rückgabewert) verwendet, so
	; Werden spätere Standard Autoit3-Messages-Befehle nicht mehr verarbeitet !!!
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND

Func _DebugPrint($s_text)
	$s_text = StringReplace($s_text, @CRLF, @CRLF & "-->")
	ConsoleWrite("!===========================================================" & @CRLF & _
			"+===========================================================" & @CRLF & _
			"-->" & $s_text & @CRLF & _
			"+===========================================================" & @CRLF)
EndFunc   ;==>_DebugPrint
