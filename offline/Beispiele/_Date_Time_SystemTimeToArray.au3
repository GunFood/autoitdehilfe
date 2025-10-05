#include "Extras\HelpFileInternals.au3"

#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>
Example()

Func Example()
	Local $tTime, $aTime

	; Erstellt die GUI
	GUICreate("Zeit", 400, 300)
	_MemoCreate(2, 2, 396, 296, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Ermittelt die momentane Systemzeit
	$tTime = _Date_Time_GetSystemTime()
	$aTime = _Date_Time_SystemTimeToArray($tTime)
	_MemoWrite("Monat ........: " & $aTime[0])
	_MemoWrite("Tag ..........: " & $aTime[1])
	_MemoWrite("Jahr .........: " & $aTime[2])
	_MemoWrite("Stunde .........: " & $aTime[3])
	_MemoWrite("Minute .......: " & $aTime[4])
	_MemoWrite("Sekunde .......: " & $aTime[5])
	_MemoWrite("Millisekunde .: " & $aTime[6])
	_MemoWrite("Wochentag ..: " & $aTime[7])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example