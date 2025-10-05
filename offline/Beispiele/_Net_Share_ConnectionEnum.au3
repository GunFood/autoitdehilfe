#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <NetShare.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $sServer, $sShare, $aInfo

	; Erstellt eine GUI
	GUICreate("_Net_Share", 400, 300)

	; Erstellt ein Memo Control
	_MemoCreate(2, 2, 396, 296, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Frage nach Server- und Freigabename
	$sServer = InputBox("Netzwerk Demo", "Gib den Servernamen ein:", "\Server", "", 200, 130) ;
	;. für den lokalen Computer
	If @error Then Exit
	$sShare = InputBox("Netzwerk Demo", "Gib den Freigabenamen ein:", "SharedDocs", "", 200, 130)
	If @error Then Exit

	; Auflistung der Netzwerkverbindungen
	$aInfo = _Net_Share_ConnectionEnum($sServer, $sShare)
	_MemoWrite("Fehler...................: " & @error)
	_MemoWrite("Einträge gelesen.........: " & $aInfo[0][0])
	For $iI = 1 To $aInfo[0][0]
		_MemoWrite("Verbindungs-ID ..........: " & $aInfo[$iI][0])
		_MemoWrite("Verbindungstyp ..........: " & _Net_Share_ResourceStr($aInfo[$iI][1]))
		_MemoWrite("Geöffnete Dateien .......: " & $aInfo[$iI][2])
		_MemoWrite("Benutzerzahl ............: " & $aInfo[$iI][3])
		_MemoWrite("Verbindungszeit .........: " & $aInfo[$iI][4])
		_MemoWrite("Benutzername ............: " & $aInfo[$iI][5])
		_MemoWrite("Netzwerkname ............: " & $aInfo[$iI][6])
		_MemoWrite()
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example