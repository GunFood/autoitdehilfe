#include <GuiConstantsEx.au3>
#include <NetShare.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $sServer, $aInfo

	; Erstellt eine GUI
	GUICreate("NetShare", 400, 300)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Frage nach Server- und Freigabename
	$sServer = InputBox("NetWork Demo", "Servername eintragen:", "\\MeinServer", "", 200, 130)
	If @error Then Exit

	; Gibt Informationen über die geöffnete Datei auf dem Server zurück.
	$aInfo = _Net_Share_FileEnum($sServer)
	MemoWrite("Fehler.... ..................: " & @error)
	MemoWrite("Anzahl der Einträge im Array : " & $aInfo[0][0])

	; Erzwingt, dass jede geöffnete Datei mit dem Namen "Test.txt" geschlossen wird
	For $iI = 1 To $aInfo[0][0]
		If StringInStr($aInfo[$iI][3], "Test.txt") > 0 Then
			_Net_Share_FileClose($sServer, $aInfo[$iI][0])
			MemoWrite("Datei geschlossen")
		EndIf
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
