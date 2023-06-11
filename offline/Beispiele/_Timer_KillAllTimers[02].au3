; == Beispiel 2 zur Unterdrückung aller Timer, wenn ein Timer feuert.

#include <GUIConstantsEx.au3>
#include <Timers.au3>

Local $hForm1 = GUICreate("Form1", 615, 437, 192, 124)

; Wird genutzt wenn timeOut gefeuert wird,
; um den Timer zu stoppen zu können
Global $g_idDummy = GUICtrlCreateDummy()

GUISetState(@SW_SHOW)

_Timer_SetTimer($hForm1, 1000, "_TimedActivated") ; Timer erstellen

While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit

		Case $g_idDummy
			Local $iResult = _Timer_KillAllTimers($hForm1)
			MsgBox(262144, 'Time Out Fired', '_Timer_KillAllTimers() Ergebnis = ' & $iResult)
	EndSwitch
WEnd

Func _TimedActivated($hWnd, $iMsg, $iIDTimer, $iTime)
	#forceref $hWnd, $iMsg, $iIDTimer, $iTime
	; weiter senden, um das Ereignis außerhalb des Rückrufs zu behandeln
	GUICtrlSendToDummy($g_idDummy)
EndFunc   ;==>_TimedActivated
