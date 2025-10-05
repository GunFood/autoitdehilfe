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
	$sServer = InputBox("NetWork Demo", "Eingabe des Server-Namens:", "\\MyServer", "", 200, 130)
	If @error Then Exit

	; Listet die Netzwerk-Sitzungen auf
	$aInfo = _Net_Share_SessionEnum($sServer, @ComputerName)
	_MemoWrite("Fehler ..........: " & @error)
	_MemoWrite("Gelesene Einträge ...: " & $aInfo[0][0])
	For $iI = 1 To $aInfo[0][0]
		_MemoWrite("Computernamen ..: " & $aInfo[$iI][0])
		_MemoWrite("Benutzernamen.......: " & $aInfo[$iI][1])
		_MemoWrite("Geöffnete Ressourcen .: " & $aInfo[$iI][2])
		_MemoWrite("Aktive Zeit .: " & $aInfo[$iI][3])
		_MemoWrite("Inaktive Zeit ...: " & $aInfo[$iI][4])
		_MemoWrite("Art der Verbindung : " & $aInfo[$iI][5])
		_MemoWrite("Art des Endgerätes ....: " & $aInfo[$iI][6]) ???
		_MemoWrite("Übertragene Daten ......: " & $aInfo[$iI][7]) ???
		_MemoWrite()
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example