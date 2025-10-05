#include "Extras\HelpFileInternals.au3"

#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $tSystem

	; Erstellt die GUI
	GUICreate("Zeit", 400, 300)
	_MemoCreate(2, 2, 396, 296, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Entschlüsselt die System Zeit
	$tSystem = _Date_Time_EncodeSystemTime(@MON, @MDAY, @YEAR, @HOUR, @MIN, @SEC)
	_MemoWrite("Aktuelle(s) Datum/Zeit .: " & _Date_Time_SystemTimeToDateTimeStr($tSystem))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example