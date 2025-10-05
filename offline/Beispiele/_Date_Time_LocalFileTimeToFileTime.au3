#include "Extras\HelpFileInternals.au3"

#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $tTime, $tLocal

	; Erstellt eine GUI
	GUICreate("Zeit", 400, 300)
	_MemoCreate(2, 2, 396, 296, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Zeigt ein(e) lokale(s) Datum/Zeit als UTC
	$tTime = _Date_Time_EncodeFileTime(@MON, @MDAY, @YEAR, @HOUR, @MIN, @SEC)
	$tLocal = _Date_Time_LocalFileTimeToFileTime($tTime)
	_MemoWrite("Lokale/s Datum/Zeit: " & _Date_Time_FileTimeToStr($tLocal))

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example