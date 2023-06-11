#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den TCP Service.
	TCPStartup()

	; Registriert OnAutoItExit um es aufzurufen, wenn das Script beendet wird.
	OnAutoItExitRegister("OnAutoItExit")

	; Weist einer lokalen Variable die IP-Adresse von www.autoit.de zu.
	Local $sIPAddress = TCPNameToIP("www.autoit.de")

	; Wenn ein Fehler aufgetaucht ist, so wird dieser angezeigt und False zurückgegeben.
	If @error Then
		MsgBox($MB_SYSTEMMODAL, "", "Error Code: " & @error)
		Return False
	Else
		; Zeigt die IP-Adresse an.
		MsgBox($MB_SYSTEMMODAL, "", "Die IP der Domain lautet : " & $sIPAddress & ".")
	EndIf
EndFunc   ;==>Example

Func OnAutoItExit()
	TCPShutdown() ; Schließt den TCP Service.
EndFunc   ;==>OnAutoItExit
