#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiDateTimePicker.au3>

Global $g_aDate

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("DateTimePick: Setzt und ermittelt die Systemzeit (v" & @AutoItVersion & ")", 500, 300)
	Local $hDTP = GUICtrlGetHandle(GUICtrlCreateDate("", 2, 6, 190))
	_MemoCreate(2, 32, 396, 266, 0)
	GUISetState(@SW_SHOW)

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; Setzt die Systemzeit
	Local $a_Date[7] = [False, @YEAR, 8, 19, 21, 57, 34]
	_GUICtrlDTP_SetSystemTime($hDTP, $a_Date)

	; Zeigt die Systemzeit an
	$g_aDate = _GUICtrlDTP_GetSystemTime($hDTP)
	_MemoWrite("Aktuelles Datum: " & GetDateStr())
	_MemoWrite("Aktuelle Zeit .: " & GetTimeStr())

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Gibt nur das Datum zurück
Func GetDateStr()
	Return StringFormat("%02d/%02d/%04d", $g_aDate[1], $g_aDate[2], $g_aDate[0])
EndFunc   ;==>GetDateStr

; Gibt nur die Zeit zurück
Func GetTimeStr()
	Return StringFormat("%02d:%02d:%02d", $g_aDate[3], $g_aDate[4], $g_aDate[5])
EndFunc   ;==>GetTimeStr