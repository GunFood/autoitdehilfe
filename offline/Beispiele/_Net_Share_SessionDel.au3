#include <GuiConstantsEx.au3>
#include <NetShare.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $sServer

	; Erstellt eine GUI
	GUICreate("NetShare", 400, 300)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt die Server- und die Freigabe-Informatinen
	$sServer = InputBox("NetWork Demo", "Eingabe des Server-Namens:", "\\MyServer", "", 200, 130)
	If @error Then Exit

	; Löscht alle unsere Sitzungen auf dem Server
	_Net_Share_SessionDel($sServer, @ComputerName)
	MemoWrite("Fehler ...................: " & @error)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
