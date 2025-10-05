#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <NetShare.au3>
#include <WindowsStylesConstants.au3>

#RequireAdmin ; wird für _Net_Share_ShareAdd() benötigt

Example()

Func Example()
	Local $aInfo
	Local Const $sShareName = "AutoIt Share"
	Local Const $sResourcePath = "C:\"

	; Erstellt eine GUI
	GUICreate("NetShare", 400, 300)

	; Erstellt ein Memo Control
	_MemoCreate(2, 2, 396, 296, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	Local $bShareAdded = False
	; Nachsehen, ob die Freigabe existiert
	If _Net_Share_ShareCheck(@ComputerName, "") = -1 Then
		; Erstellt eine Freigabe auf dem lokalen Computer
		$bShareAdded = _Net_Share_ShareAdd(@ComputerName, $sShareName, 0, $sResourcePath, "AutoIt Share Comment")
		If @error Then
			MsgBox($MB_SYSTEMMODAL, "Information", "Freigabe erzeugt einen Fehler : " & @error)
		Else
			_MemoWrite("Share added" & @CRLF)
		EndIf
	Else
		_MemoWrite("Freigabe existiert")
	EndIf

	If $bShareAdded Then
		; Zeigt die Informationen über die hinzugefügte Freigabe
		$aInfo = _Net_Share_ShareGetInfo(@ComputerName, $sShareName)
		_MemoWrite("Freigabenamen ..............: " & $aInfo[0])
		_MemoWrite("Art der Freigabe ...............: " & _Net_Share_ResourceStr($aInfo[1]))
		_MemoWrite("Kommentar der Freigabe.................: " & $aInfo[2])
		_MemoWrite("Rechte der Freigabe .............: " & _Net_Share_PermStr($aInfo[3]))
		_MemoWrite("Maximale Verbindungen zu der Freigabe .....: " & $aInfo[4])
		_MemoWrite("Anzahl der momentanen Verbindungen .....: " & $aInfo[5])
		_MemoWrite("Lokaler Pfad der  Freigabe ..............: " & $aInfo[6])
		_MemoWrite("Passwort der Freigabe................: " & $aInfo[7])

		; Löschen der Freigabe
		_Net_Share_ShareDel(@ComputerName, $sShareName)
		If @error Then MsgBox($MB_SYSTEMMODAL, "Information", "Fehler beim löschen der Freigabe : " & @error)
		_MemoWrite("Freigabe gelöscht")

		; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
		Do
		Until GUIGetMsg() = $GUI_EVENT_CLOSE
	EndIf
EndFunc   ;==>Example