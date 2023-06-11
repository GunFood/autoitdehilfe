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

	; Ermittelt die Server- und die Freigabe-Informationen
	$sServer = InputBox("NetWork Demo", "Eingabe des Servernamens:", "\\MyServer", "", 200, 130)
	If @error Then Exit

	; Ermittelt die Sitzungs-Informationen
	$aInfo = _Net_Share_SessionGetInfo($sServer, @ComputerName, "Administrator")
	MemoWrite("Fehler ..........: " & @error)
	MemoWrite("Computername ..: " & $aInfo[0])
	MemoWrite("Benutzername ......: " & $aInfo[1])
	MemoWrite("Geöffnete Ressourcen .: " & $aInfo[2])
	MemoWrite("Aktive Zeit .: " & $aInfo[3])
	MemoWrite("Inaktive Zeit ...: " & $aInfo[4])
	MemoWrite("Art der Verbindung : " & $aInfo[5])
	MemoWrite("Art des Endgerätes ....: " & $aInfo[6])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
