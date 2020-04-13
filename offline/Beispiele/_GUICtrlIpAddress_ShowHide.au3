#include <GuiConstantsEx.au3>
#include <GuiIPAddress.au3>

Example()

Func Example()
	Local $hGui, $hIPAddress

	$hGui = GUICreate("IpAddress: Control zeigen bzw. verstecken", 300, 150)
	$hIPAddress = _GUICtrlIpAddress_Create($hGui, 10, 10)
	GUISetState(@SW_SHOW)

	_GUICtrlIpAddress_Set($hIPAddress, "24.168.2.128")

	Sleep(1000)
	_GUICtrlIpAddress_ShowHide($hIPAddress, @SW_HIDE)
	Sleep(1000)
	_GUICtrlIpAddress_ShowHide($hIPAddress, @SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
