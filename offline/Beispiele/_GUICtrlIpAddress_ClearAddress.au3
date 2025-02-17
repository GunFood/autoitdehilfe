#include <GUIConstantsEx.au3>
#include <GuiIPAddress.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui, $hIPAddress

	$hGui = GUICreate("IpAddress: IP-Adresse löschen", 420, 300)
	$hIPAddress = _GUICtrlIpAddress_Create($hGui, 10, 10)
	GUISetState(@SW_SHOW)

	_GUICtrlIpAddress_Set($hIPAddress, "24.168.2.128")

	; Eingetragene IP-Adresse löschen
	MsgBox($MB_SYSTEMMODAL, "Information", "IP-Adresse löschen")
	_GUICtrlIpAddress_ClearAddress($hIPAddress)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
