; *** Demo zur Anzeige eines Timers

#include <Date.au3>
#include <GUIConstantsEx.au3>

Global $g_hTimer, $g_iSecs, $g_iMins, $g_iHour, $g_sTime

Example()

Func Example()
	; Erstellt die GUI
	GUICreate("Timer", 150, 50)
	GUICtrlCreateLabel("00:00:00", 55, 20)
	GUISetState(@SW_SHOW)
	; Startet Timer
	$g_hTimer = TimerInit()
	; Die Funktion Timer wird alle 50 ms aufgerufen
	AdlibRegister("Timer", 50)
	;
	While 1
		; FileWriteLine("debug.log",@min & ":" & @sec & " ==> vorher")
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				Exit
		EndSwitch
		; FileWriteLine("debug.log",@min & ":" & @sec & " ==> nachher")
	WEnd
EndFunc   ;==>Example
;
Func Timer()
	_TicksToTime(Int(TimerDiff($g_hTimer)), $g_iHour, $g_iMins, $g_iSecs)
	Local $sTime = $g_sTime ; Letzten Timerstand merken, um den Vergleich zu ermöglichen und Flackern zu vermeiden..
	$g_sTime = StringFormat("%02i:%02i:%02i", $g_iHour, $g_iMins, $g_iSecs)
	If $sTime <> $g_sTime Then ControlSetText("Timer", "", "Static1", $g_sTime)
EndFunc   ;==>Timer
