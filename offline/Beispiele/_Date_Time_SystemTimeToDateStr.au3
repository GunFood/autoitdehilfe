#include "Extras\HelpFileInternals.au3"

#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $tDate

	; Erstellt die GUI
	GUICreate("Zeit", 400, 300)
	_MemoCreate(2, 2, 396, 296, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Auslesen des aktuellen System Datums
	$tDate = _Date_Time_GetSystemTime()
	_MemoWrite("Aktuelles System Datum .: " & _Date_Time_SystemTimeToDateStr($tDate))
	_MemoWrite("Aktuelles System Datum .: " & _Date_Time_SystemTimeToDateStr($tDate, 1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example