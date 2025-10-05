#include "Extras\HelpFileInternals.au3"

#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $aTime

	; Erstellt die GUI
	GUICreate("Zeit", 400, 300)
	_MemoCreate(2, 2, 396, 296, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Ermittelt die System-Zeiten
	$aTime = _Date_Time_GetSystemTimes()

	_MemoWrite("Zeit des Leerlaufs ...: " & _Date_Time_FileTimeToStr($aTime[0]))
	_MemoWrite("System Zeit .: " & _Date_Time_FileTimeToStr($aTime[1]))
	_MemoWrite("Benutzer Zeit ...: " & _Date_Time_FileTimeToStr($aTime[2]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example