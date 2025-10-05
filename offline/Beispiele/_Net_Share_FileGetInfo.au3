#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <NetShare.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $sServer, $aFile, $aInfo

	; Erstellt eine GUI
	GUICreate("NetShare", 400, 300)

	; Erstellt ein Memo Control
	_MemoCreate(2, 2, 396, 296, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Ermitteln der Server- und Freigabeinformationen
	$sServer = InputBox("Netzwerk Demo", "Server Namen eingeben:", "\\MeinServer", "", 200, 130)
	If @error Then Exit

	; Auflisten der freigegebenen Dateien auf dem Server
	$aFile = _Net_Share_FileEnum($sServer)
	_MemoWrite("Fehler ...................: " & @error)
	_MemoWrite("Einträge lesen ............: " & $aFile[0][0])
	_MemoWrite()

	; Informationen über jede (freigegebene|geöffnete?) Datei ermitteln (dasselbe wie $aFile info)
	For $iI = 1 To $aFile[0][0]
		$aInfo = _Net_Share_FileGetInfo($sServer, $aFile[$iI][0])
		_MemoWrite("Fehler ...................: " & @error)
		_MemoWrite("Datei Benutzerrechte .....: " & _Net_Share_PermStr($aInfo[1]))
		_MemoWrite("Datei Sperren ............: " & $aInfo[2])
		_MemoWrite("Datei Pfad ...............: " & $aInfo[3])
		_MemoWrite("Datei Benutzer ...........: " & $aInfo[4])
		_MemoWrite()
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example