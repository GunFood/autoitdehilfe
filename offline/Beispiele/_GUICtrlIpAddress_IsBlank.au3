#include <GuiConstantsEx.au3>
#include <GuiIPAddress.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGui, $hIPAddress

	$hGui = GUICreate("IpAddress: Ermittelt ob alle Felder leer sind", 450, 300)
	$hIPAddress = _GUICtrlIpAddress_Create($hGui, 2, 4)
	$g_idMemo = GUICtrlCreateEdit("", 2, 28, 396, 270, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Prüfen, ob die IP-Adresse leer ist
	MemoWrite("Leer: " & _GUICtrlIpAddress_IsBlank($hIPAddress))

	Sleep(1000)

	_GUICtrlIpAddress_Set($hIPAddress, "24.168.2.128")

	; Prüfen, ob die IP-Adresse leer ist
	MemoWrite("Leer: " & _GUICtrlIpAddress_IsBlank($hIPAddress))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
