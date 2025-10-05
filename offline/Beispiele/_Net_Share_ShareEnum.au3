#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <NetShare.au3>
#include <WindowsStylesConstants.au3>

#RequireAdmin ; wird für _Net_Share_ShareAdd() benötigt, falls erforderlich

Example()

Func Example()
	Local $iI, $aInfo
	Local Const $sShareName = "AutoIt Share"
	Local Const $sResourcePath = "C:\"

	; Erstellt eine GUI
	GUICreate("NetShare", 400, 300)

	; Erstellt ein Memo Control
	_MemoCreate(2, 2, 396, 296, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	Local $bShareAdded = False
	; Prüfen, ob die Freigabe existiert
	If _Net_Share_ShareCheck(@ComputerName, $sResourcePath) = -1 Then
		; Eine Freigabe auf dem lokalen Computer erstellen
		$bShareAdded = _Net_Share_ShareAdd(@ComputerName, $sShareName, 0, $sResourcePath, "AutoIt Share Comment")
		If @error Then MsgBox($MB_SYSTEMMODAL, "Information", "Fehler beim Hinzufügen der Freigabe : " & @error)
		_MemoWrite("Freigabe hinzugefügt")
	Else
		_MemoWrite("Freigabe existiert")
	EndIf

	; Listet Informationen über alle lokalen Freigaben auf
	$aInfo = _Net_Share_ShareEnum(@ComputerName)
	_MemoWrite("Einträge lesen ............: " & $aInfo[0][0])
	For $iI = 1 To $aInfo[0][0]
		_MemoWrite("Freigabename .............: " & $aInfo[$iI][0])
		_MemoWrite("Freigabetyp...............: " & _Net_Share_ResourceStr($aInfo[$iI][1]))
		_MemoWrite("Kommentar ................: " & $aInfo[$iI][2])
		_MemoWrite("Benutzerrechte ...........: " & _Net_Share_PermStr($aInfo[$iI][3]))
		_MemoWrite("Maximale Verbindungen ....: " & $aInfo[$iI][4])
		_MemoWrite("Aktuelle Verbindungen ....: " & $aInfo[$iI][5])
		_MemoWrite("Lokaler Pfad .............: " & $aInfo[$iI][6])
		_MemoWrite("Passwort .................: " & $aInfo[$iI][7])
		_MemoWrite()
	Next

	If $bShareAdded Then
		; Freigabe entfernen
		_Net_Share_ShareDel(@ComputerName, $sShareName)
		If @error Then MsgBox($MB_SYSTEMMODAL, "Information", "Fehler beim Entfernen der Freigabe : " & @error)
		_MemoWrite("Freigabe entfernt")
	EndIf

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example