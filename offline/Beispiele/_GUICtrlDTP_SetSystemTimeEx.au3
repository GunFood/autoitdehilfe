#include <GuiConstantsEx.au3>
#include <GuiDateTimePicker.au3>

Global $g_idMemo, $g_tDate

Example()

Func Example()
	Local $hDTP

	; Erstellt eine GUI
	GUICreate("DateTimePick: Setzt die Systemzeit mit Set System TimeEx", 400, 300)
	$hDTP = GUICtrlGetHandle(GUICtrlCreateDate("", 2, 6, 190))
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; Setzt die Systemzeit
	$g_tDate = DllStructCreate($tagSYSTEMTIME)
	DllStructSetData($g_tDate, "Year", @YEAR)
	DllStructSetData($g_tDate, "Month", 8)
	DllStructSetData($g_tDate, "Day", 19)
	DllStructSetData($g_tDate, "Hour", 21)
	DllStructSetData($g_tDate, "Minute", 57)
	DllStructSetData($g_tDate, "Second", 34)
	_GUICtrlDTP_SetSystemTimeEx($hDTP, $g_tDate)

	; Zeigt die Systemzeit an
	$g_tDate = _GUICtrlDTP_GetSystemTimeEx($hDTP)
	MemoWrite("Ausgewähltes Datum: " & GetDateStr())
	MemoWrite("Ausgewähltes Zeit .: " & GetTimeStr())

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Gibt nur das Datum zurück
Func GetDateStr()
	Return StringFormat("%02d/%02d/%04d", DllStructGetData($g_tDate, "Month"), DllStructGetData($g_tDate, "Day"), DllStructGetData($g_tDate, "Year"))
EndFunc   ;==>GetDateStr

; Gibt nur die Zeit zurück
Func GetTimeStr()
	Return StringFormat("%02d:%02d:%02d", DllStructGetData($g_tDate, "Hour"), DllStructGetData($g_tDate, "Minute"), DllStructGetData($g_tDate, "Second"))
EndFunc   ;==>GetTimeStr

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
