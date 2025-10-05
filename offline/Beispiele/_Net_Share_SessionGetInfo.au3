#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <NetShare.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $sServer, $aInfo

	; Erstellt eine GUI
	GUICreate("NetShare", 400, 300)

	; Erstellt ein Memo Control
	_MemoCreate(2, 2, 396, 296, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Ermittelt die Server- und die Freigabe-Informationen
	$sServer = InputBox("NetWork Demo", "Eingabe des Servernamens:", "\\MyServer", "", 200, 130)
	If @error Then Exit

	; Ermittelt die Sitzungs-Informationen
	$aInfo = _Net_Share_SessionGetInfo($sServer, @ComputerName, "Administrator")
	_MemoWrite("Fehler ..........: " & @error)
	_MemoWrite("Computername ..: " & $aInfo[0])
	_MemoWrite("Benutzername ......: " & $aInfo[1])
	_MemoWrite("Geöffnete Ressourcen .: " & $aInfo[2])
	_MemoWrite("Aktive Zeit .: " & $aInfo[3])
	_MemoWrite("Inaktive Zeit ...: " & $aInfo[4])
	_MemoWrite("Art der Verbindung : " & $aInfo[5])
	_MemoWrite("Art des Endgerätes ....: " & $aInfo[6])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example