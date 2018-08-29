#include <GuiConstantsEx.au3>
#include <GuiDateTimePicker.au3>

Global $g_idMemo, $g_tRange

Example()

Func Example()
	Local $hDTP

	; Erstellt eine GUI
	GUICreate("DateTimePick: Setzt den Bereich mit Set RangeEx", 400, 300)
	$hDTP = GUICtrlGetHandle(GUICtrlCreateDate("", 2, 6, 190))
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; Setzt den Datumsbereich
	$g_tRange = DllStructCreate($tagDTPRANGE)
	DllStructSetData($g_tRange, "MinValid", True)
	DllStructSetData($g_tRange, "MinYear", @YEAR)
	DllStructSetData($g_tRange, "MinMonth", 1)
	DllStructSetData($g_tRange, "MinDay", 1)
	DllStructSetData($g_tRange, "MaxValid", True)
	DllStructSetData($g_tRange, "MaxYear", @YEAR)
	DllStructSetData($g_tRange, "MaxMonth", 12)
	DllStructSetData($g_tRange, "MaxDay", 31)
	DllStructSetData($g_tRange, "MaxHour", 12)
	DllStructSetData($g_tRange, "MaxMinute", 59)
	DllStructSetData($g_tRange, "MaxSecond", 59)
	_GUICtrlDTP_SetRangeEx($hDTP, $g_tRange)

	; Zeigt den Datumsbereich an
	$g_tRange = _GUICtrlDTP_GetRangeEx($hDTP)
	MemoWrite("Minimales Datum: " & GetDateStr("Min"))
	MemoWrite("Maximales Datum: " & GetDateStr("Max"))
	MemoWrite("Minimale Zeit .: " & GetTimeStr("Min"))
	MemoWrite("Maximale Zeit .: " & GetTimeStr("Max"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Gibt nur das Datum zurück
Func GetDateStr($sPrefix)
	If $sPrefix = "Min" Then
		Return StringFormat("%02d/%02d/%04d", DllStructGetData($g_tRange, "MinMonth"), DllStructGetData($g_tRange, "MinDay"), DllStructGetData($g_tRange, "MinYear"))
	Else
		Return StringFormat("%02d/%02d/%04d", DllStructGetData($g_tRange, "MaxMonth"), DllStructGetData($g_tRange, "MaxDay"), DllStructGetData($g_tRange, "MaxYear"))
	EndIf
EndFunc   ;==>GetDateStr

; Gibt nur die Zeit zurück
Func GetTimeStr($sPrefix)
	If $sPrefix = "Min" Then
		Return StringFormat("%02d:%02d:%02d", DllStructGetData($g_tRange, "MinHour"), DllStructGetData($g_tRange, "MinMinute"), DllStructGetData($g_tRange, "MinSecond"))
	Else
		Return StringFormat("%02d:%02d:%02d", DllStructGetData($g_tRange, "MaxHour"), DllStructGetData($g_tRange, "MaxMinute"), DllStructGetData($g_tRange, "MaxSecond"))
	EndIf
EndFunc   ;==>GetTimeStr

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
