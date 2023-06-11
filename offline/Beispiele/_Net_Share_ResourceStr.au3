#include <GuiConstantsEx.au3>
#include <NetShare.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $sServer, $sShare, $aInfo

	; Erstellt eine GUI
	GUICreate("_Net_Share", 400, 300)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Frage nach Server- und Freigabename
	$sServer = InputBox("Netzwerk Demo", "Gib den Servernamen ein:", "\\.", "", 200, 130) ; \\. für den lokalen Computer
	If @error Then Exit
	$sShare = InputBox("Netzwerk Demo", "Gib den Freigabenamen ein:", "SharedDocs", "", 200, 130)
	If @error Then Exit

	; Auflistung der Netzwerkverbindungen
	$aInfo = _Net_Share_ConnectionEnum($sServer, $sShare)
	MemoWrite("Fehler...................: " & @error)
	MemoWrite("Einträge gelesen.........: " & $aInfo[0][0])
	For $iI = 1 To $aInfo[0][0]
		MemoWrite("Verbindungs-ID ..........: " & $aInfo[$iI][0])
		MemoWrite("Verbindungstyp ..........: " & _Net_Share_ResourceStr($aInfo[$iI][1]))
		MemoWrite("Geöffnete Dateien .......: " & $aInfo[$iI][2])
		MemoWrite("Benutzerzahl ............: " & $aInfo[$iI][3])
		MemoWrite("Verbindungszeit .........: " & $aInfo[$iI][4])
		MemoWrite("Benutzername ............: " & $aInfo[$iI][5])
		MemoWrite("Netzwerkname ............: " & $aInfo[$iI][6])
		MemoWrite()
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
