; == Beendet den UDP Service

Example()

Func Example()
	UDPStartup() ; Startet den UDP Service.

	; Registriert OnAutoItExit, damit dieses aufgerufen wird wenn das Skript beendet wird.
	OnAutoItExitRegister("OnAutoItExit")
EndFunc   ;==>Example

Func OnAutoItExit()
	UDPShutdown() ; Beendet den UDP Service.
EndFunc   ;==>OnAutoItExit
