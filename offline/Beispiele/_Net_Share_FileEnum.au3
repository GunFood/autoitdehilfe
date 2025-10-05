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

	; Ermitteln der Server und Freigabe Informationen
	$sServer = InputBox("Netzwerk Demo", "Server Namen eingeben:", "\\MeinServer", "", 200, 130)
	If @error Then Exit

	; Auflisten der freigegebenen Dateien auf dem Server
	$aInfo = _Net_Share_FileEnum($sServer)
	_MemoWrite("Fehler ....................: " & @error)
	_MemoWrite("Einträge lesen ............: " & $aInfo[0][0])
	For $iI = 1 To $aInfo[0][0]
		_MemoWrite("Ressource ID ................: " & $aInfo[$iI][0])
		_MemoWrite("Ressource Benutzerrechte ....: " & _Net_Share_PermStr($aInfo[$iI][1]))
		_MemoWrite("Ressource Sperren ...........: " & $aInfo[$iI][2])
		_MemoWrite("Ressource Pfad ..............: " & $aInfo[$iI][3])
		_MemoWrite("Ressource Benutzer ..........: " & $aInfo[$iI][4])
		_MemoWrite()
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example