#include <GuiConstantsEx.au3>
#include <GuiIPAddress.au3>

Example()

Func Example()
	Local $hGui, $hIPAddress

	$hGui = GUICreate("IpAddress: Fokus setzen", 400, 300)
	$hIPAddress = _GUICtrlIpAddress_Create($hGui, 2, 4)
	GUISetState(@SW_SHOW)

	_GUICtrlIpAddress_Set($hIPAddress, "24.168.2.128")

	_GUICtrlIpAddress_SetFocus($hIPAddress, 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
