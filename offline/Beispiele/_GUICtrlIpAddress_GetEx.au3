#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiIPAddress.au3>
#include <StructureConstants.au3>

Example()

Func Example()
	Local $hGui = GUICreate("IP Address: Setzt und ermittelt die IP-Adresse (v" & @AutoItVersion & ")", 500, 300)
	Local $hIPAddress = _GUICtrlIpAddress_Create($hGui, 2, 4, 125, 20)
	_MemoCreate(2, 28, 396, 270, 0)

	GUISetState(@SW_SHOW)

	Local $tIP = DllStructCreate($tagGetIPAddress), $aIP[4] = [24, 168, 2, 128]
	For $x = 0 To 3
		DllStructSetData($tIP, "Field" & $x + 1, $aIP[$x])
	Next

	_GUICtrlIpAddress_SetEx($hIPAddress, $tIP)

	$tIP = _GUICtrlIpAddress_GetEx($hIPAddress)

	For $x = 0 To 3
		_MemoWrite("Feld " & $x + 1 & " .....: " & DllStructGetData($tIP, "Field" & $x + 1))
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example