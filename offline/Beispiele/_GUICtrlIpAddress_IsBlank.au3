#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiIPAddress.au3>

Example()

Func Example()
	Local $hGui, $hIPAddress

	$hGui = GUICreate("IpAddress: Ermittelt ob alle Felder leer sind", 450, 300)
	$hIPAddress = _GUICtrlIpAddress_Create($hGui, 2, 4)
	_MemoCreate(2, 28, 396, 270, 0)
	GUISetState(@SW_SHOW)

	; Prüfen, ob die IP-Adresse leer ist
	_MemoWrite("Leer: " & _GUICtrlIpAddress_IsBlank($hIPAddress))

	Sleep(1000)

	_GUICtrlIpAddress_Set($hIPAddress, "24.168.2.128")

	; Prüfen, ob die IP-Adresse leer ist
	_MemoWrite("Leer: " & _GUICtrlIpAddress_IsBlank($hIPAddress))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example