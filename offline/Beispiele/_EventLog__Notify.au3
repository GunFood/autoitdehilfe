#include "Extras\HelpFileInternals.au3"

#include <EventLog.au3>
#include <FontConstants.au3>
#include <GUIConstantsEx.au3>
#include <WinAPIHObj.au3>
#include <WinAPIProc.au3>

Example()

Func Example()
	Local $hEventLog, $hEvent, $iResult

	; Erstellt eine GUI
	GUICreate("EventLog", 600, 300)
	_MemoCreate(2, 2, 596, 294, 0)
	GUISetState(@SW_SHOW)

	; Ereignis einrichten
	$hEventLog = _EventLog__Open("", "Security")
	$hEvent = _WinAPI_CreateEvent(0, False, False, "")
	_EventLog__Notify($hEventLog, $hEvent)

	; Wartet, bis ein neues Ereignis auftritt
	_MemoWrite("Warte auf neues Ereignis...")
	$iResult = _WinAPI_WaitForSingleObject($hEvent)
	_WinAPI_CloseHandle($hEvent)
	_EventLog__Close($hEventLog)

	; Gibt die Resultate aus
	If $iResult = -1 Then
		_MemoWrite("Warten war umsonst!")
	Else
		_MemoWrite("Es ist ein neues Ereignis aufgetreten!")
	EndIf

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example