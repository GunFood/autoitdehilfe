; == Beendet den TCP Service.

Example()

Func Example()
	TCPStartup() ; Startet den TCP Service.

	; Registriert OnAutoItExit, damit dieses aufgerufen wird wenn das Skript beendet wird.
	OnAutoItExitRegister("OnAutoItExit")
EndFunc   ;==>Example

Func OnAutoItExit()
	TCPShutdown() ; Beendet den TCP Service.
EndFunc   ;==>OnAutoItExit
