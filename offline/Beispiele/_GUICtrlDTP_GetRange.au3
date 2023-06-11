#include <GuiConstantsEx.au3>
#include <GuiDateTimePicker.au3>

Global $g_idMemo, $g_aRange[14] = [True, @YEAR, 1, 1, 21, 45, 32, True, @YEAR, 12, 31, 23, 59, 59]

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("DateTimePick: Setzt und ermittelt den Bereich (v" & @AutoItVersion & ")", 500, 300)
	Local $hDTP = GUICtrlGetHandle(GUICtrlCreateDate("", 2, 6, 190))
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; Setzt den Datumsbereich
	_GUICtrlDTP_SetRange($hDTP, $g_aRange)

	; Zeigt den Datumsbereich an
	$g_aRange = _GUICtrlDTP_GetRange($hDTP)
	MemoWrite("Minimales Datum: " & GetDateStr(0))
	MemoWrite("Maximales Datum: " & GetDateStr(7))
	MemoWrite("Minimale Zeit .: " & GetTimeStr(4))
	MemoWrite("Maximale Zeit .: " & GetTimeStr(11))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Gibt nur das Datum zurück
Func GetDateStr($iOff = 0)
	Return StringFormat("%02d/%02d/%04d", $g_aRange[$iOff + 2], $g_aRange[$iOff + 3], $g_aRange[$iOff + 1])
EndFunc   ;==>GetDateStr

; Gibt nur die Zeit zurück
Func GetTimeStr($iOff = 0)
	Return StringFormat("%02d:%02d:%02d", $g_aRange[$iOff], $g_aRange[$iOff + 1], $g_aRange[$iOff + 2])
EndFunc   ;==>GetTimeStr

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
