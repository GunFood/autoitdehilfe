#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <NetShare.au3>
#include <WindowsConstants.au3>

#RequireAdmin ; wird für _Net_Share_ShareAdd() benötigt

Global $g_idMemo

Example()

Func Example()
	Local $aInfo
	Local Const $sShareName = "AutoIt Share"

	; Erstellt eine GUI
	GUICreate("NetShare", 400, 300)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Nachsehen, ob die Freigabe existiert
	If _Net_Share_ShareCheck(@ComputerName, $sShareName) = -1 Then
		; Erstellt eine Freigabe auf dem lokalen Computer
		_Net_Share_ShareAdd(@ComputerName, $sShareName, 0, "C:\", "AutoIt Share Comment")
		If @error Then MsgBox($MB_SYSTEMMODAL, "Information", "Freigabe erzeugt einen Fehler : " & @error)
		MemoWrite("Freigabe hinzugefügt")
	Else
		MemoWrite("Freigabe existiert")
	EndIf

	; Ändern der Freigabe Informationen
	_Net_Share_ShareSetInfo(@ComputerName, $sShareName, "Neuer Kommentar", 4)

	; Zeigt die Informationen über die hinzugefügte Freigabe
	$aInfo = _Net_Share_ShareGetInfo(@ComputerName, $sShareName)
	MemoWrite("Freigabenamen ..............: " & $aInfo[0])
	MemoWrite("Art der Freigabe ...............: " & _Net_Share_ResourceStr($aInfo[1]))
	MemoWrite("Kommentar der Freigabe.................: " & $aInfo[2])
	MemoWrite("Rechte der Freigabe .............: " & _Net_Share_PermStr($aInfo[3]))
	MemoWrite("Maximale Verbindungen zu der Freigabe .....: " & $aInfo[4])
	MemoWrite("Anzahl der momentanen Verbindungen  .....: " & $aInfo[5])
	MemoWrite("Lokaler Pfad der  Freigabe ..............: " & $aInfo[6])
	MemoWrite("Passwort der Freigabe................: " & $aInfo[7])

	; Löscht die Freigabe
	_Net_Share_ShareDel(@ComputerName, $sShareName)
	If @error Then MsgBox($MB_SYSTEMMODAL, "Information", "Fehler beim löschen der Freigabe : " & @error)
	MemoWrite("Freigabe gelöscht")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
