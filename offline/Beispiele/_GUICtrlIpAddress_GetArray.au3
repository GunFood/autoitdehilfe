#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiIPAddress.au3>

Example()

Func Example()
	Local $hGui = GUICreate("IpAddress: Setzt und ermittelt die IP Adresse (Array) (v" & @AutoItVersion & ")", 500, 300)
	Local $hIPAddress = _GUICtrlIpAddress_Create($hGui, 2, 4, 125, 20)
	_MemoCreate(2, 28, 396, 270, 0)
	GUISetState(@SW_SHOW)

	Local $aIP[4] = [24, 168, 2, 128]
	_GUICtrlIpAddress_SetArray($hIPAddress, $aIP)

	$aIP = _GUICtrlIpAddress_GetArray($hIPAddress)

	_MemoWrite("Feld 1 .....: " & $aIP[0])
	_MemoWrite("Feld 2 .....: " & $aIP[1])
	_MemoWrite("Feld 3 .....: " & $aIP[2])
	_MemoWrite("Feld 4 .....: " & $aIP[3])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example