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

	; Frage nach Server- und Freigabename
	$sServer = InputBox("NetWork Demo", "Servername eintragen:", "\\MeinServer", "", 200, 130)
	If @error Then Exit

	; Gibt Informationen über die geöffnete Datei auf dem Server zurück.
	$aInfo = _Net_Share_FileEnum($sServer)
	_MemoWrite("Fehler.... ..................: " & @error)
	_MemoWrite("Anzahl der Einträge im Array : " & $aInfo[0][0])

	; Erzwingt, dass jede geöffnete Datei mit dem Namen "Test.txt" geschlossen wird
	For $iI = 1 To $aInfo[0][0]
		If StringInStr($aInfo[$iI][3], "Test.txt") > 0 Then
			_Net_Share_FileClose($sServer, $aInfo[$iI][0])
			_MemoWrite("Datei geschlossen")
		EndIf
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example