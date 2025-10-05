#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiDateTimePicker.au3>
#include <StructureConstants.au3>

Global $g_tDate

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("DateTimePick: Ermittelt die Systemzeit mit System TimeEx (v" & @AutoItVersion & ")", 600, 300)
	Local $hDTP = GUICtrlGetHandle(GUICtrlCreateDate("", 2, 6, 190))
	_MemoCreate(2, 32, 396, 266, 0)
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
	_MemoWrite("Aktuelles Datum: " & GetDateStr())
	_MemoWrite("Aktuelle Zeit .: " & GetTimeStr())

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