#include <GUIConstantsEx.au3>
#include <GuiIPAddress.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui = GUICreate("IpAddress: Setzt und ermittelt die IP Adresse ermitteln (String) (v" & @AutoItVersion & ")", 600, 300)
	Local $hIPAddress = _GUICtrlIpAddress_Create($hGui, 10, 10)
	GUISetState(@SW_SHOW)

	_GUICtrlIpAddress_Set($hIPAddress, "24.168.2.128")

	MsgBox($MB_SYSTEMMODAL, "Information", "IP Adresse: " & _GUICtrlIpAddress_Get($hIPAddress))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
