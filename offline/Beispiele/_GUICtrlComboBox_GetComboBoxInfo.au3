#include "Extras\HelpFileInternals.au3"

#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $tInfo, $idCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Informationen ermitteln", 400, 296)
	$idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	_MemoCreate(2, 32, 396, 266, 0)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	If _GUICtrlComboBox_GetComboBoxInfo($idCombo, $tInfo) Then
		_MemoWrite("Handle der ComboBox ........: " & DllStructGetData($tInfo, "hCombo"))
		_MemoWrite("Handle der EditBox .........: " & DllStructGetData($tInfo, "hEdit"))
		_MemoWrite('Handle der "Drop-down"-Liste: ' & DllStructGetData($tInfo, "hList"))
	EndIf

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example