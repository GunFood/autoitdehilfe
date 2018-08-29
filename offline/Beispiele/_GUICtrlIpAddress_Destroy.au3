#include <GUIConstantsEx.au3>
#include <GuiIPAddress.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGui, $hIPAddress

	$hGui = GUICreate("IpAddress: Löschen", 400, 300)
	$hIPAddress = _GUICtrlIpAddress_Create($hGui, 10, 10, 125, 30, $WS_THICKFRAME)
	GUISetState(@SW_SHOW)

	; IPAddress-Control löschen
	MsgBox($MB_SYSTEMMODAL, "Information", "IPAddress-Control löschen")
	_GUICtrlIpAddress_Destroy($hIPAddress)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
