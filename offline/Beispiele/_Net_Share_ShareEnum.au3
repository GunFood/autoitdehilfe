#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <NetShare.au3>
#include <WindowsConstants.au3>

#RequireAdmin ; wird für _Net_Share_ShareAdd() benötigt, falls erforderlich

Global $g_idMemo

Example()

Func Example()
	Local $iI, $aInfo
	Local Const $sShareName = "AutoIt Share"
	Local Const $sResourcePath = "C:\"

	; Erstellt eine GUI
	GUICreate("NetShare", 400, 300)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	Local $bShareAdded = False
	; Prüfen, ob die Freigabe existiert
	If _Net_Share_ShareCheck(@ComputerName, $sResourcePath) = -1 Then
		; Eine Freigabe auf dem lokalen Computer erstellen
		$bShareAdded = _Net_Share_ShareAdd(@ComputerName, $sShareName, 0, $sResourcePath, "AutoIt Share Comment")
		If @error Then MsgBox($MB_SYSTEMMODAL, "Information", "Fehler beim Hinzufügen der Freigabe : " & @error)
		MemoWrite("Freigabe hinzugefügt")
	Else
		MemoWrite("Freigabe existiert")
	EndIf

	; Listet Informationen über alle lokalen Freigaben auf
	$aInfo = _Net_Share_ShareEnum(@ComputerName)
	MemoWrite("Einträge lesen ............: " & $aInfo[0][0])
	For $iI = 1 To $aInfo[0][0]
		MemoWrite("Freigabename .............: " & $aInfo[$iI][0])
		MemoWrite("Freigabetyp...............: " & _Net_Share_ResourceStr($aInfo[$iI][1]))
		MemoWrite("Kommentar ................: " & $aInfo[$iI][2])
		MemoWrite("Benutzerrechte ...........: " & _Net_Share_PermStr($aInfo[$iI][3]))
		MemoWrite("Maximale Verbindungen ....: " & $aInfo[$iI][4])
		MemoWrite("Aktuelle Verbindungen ....: " & $aInfo[$iI][5])
		MemoWrite("Lokaler Pfad .............: " & $aInfo[$iI][6])
		MemoWrite("Passwort .................: " & $aInfo[$iI][7])
		MemoWrite()
	Next

	If $bShareAdded Then
		; Freigabe entfernen
		_Net_Share_ShareDel(@ComputerName, $sShareName)
		If @error Then MsgBox($MB_SYSTEMMODAL, "Information", "Fehler beim Entfernen der Freigabe : " & @error)
		MemoWrite("Freigabe entfernt")
	EndIf

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
