#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ermittelt die Sprach-ID", 400, 296)
	$idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Zeigt die Gebietsschema-Einstellung, den Ländercode und die Sprach-Identifizierer an
	MsgBox($MB_SYSTEMMODAL, "Information", _
			"Gebietsschema ...: " & _GUICtrlComboBox_GetLocale($idCombo) & @CRLF & _
			"Ländercode ......: " & _GUICtrlComboBox_GetLocaleCountry($idCombo) & @CRLF & _
			"Sprach-ID........: " & _GUICtrlComboBox_GetLocaleLang($idCombo) & @CRLF & _
			"Primäre Sprach-ID: " & _GUICtrlComboBox_GetLocalePrimLang($idCombo) & @CRLF & _
			"Sub-Sprach-ID ...: " & _GUICtrlComboBox_GetLocaleSubLang($idCombo))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
