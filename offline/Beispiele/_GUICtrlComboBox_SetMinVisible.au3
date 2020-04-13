#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Setzt die minimale Anzahl sichtbarer Items", 440, 450)
	$idCombo = GUICtrlCreateCombo("", 2, 2, 436, 426)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "\*.*")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Ermittelt die minimale Anzahl sichtbarer Items der aufgeklappten Liste
	MsgBox(8256, "Information", "Standardmäßig Sichtbar:" & @TAB & _GUICtrlComboBox_GetMinVisible($idCombo), 2.5)

	; Zeigt die ListBox der ComboBox
	_GUICtrlComboBox_ShowDropDown($idCombo, True)

	Sleep(500)

	; Setzt die minimale Anzahl sichtbarer Items
	_GUICtrlComboBox_SetMinVisible($idCombo, 40)

	; Versteckt die ListBox der ComboBox
	_GUICtrlComboBox_ShowDropDown($idCombo)

	Sleep(500)

	_GUICtrlComboBox_ShowDropDown($idCombo, True)

	Sleep(500)

	; Ermittelt die minimale Anzahl sichtbarer Items
	MsgBox(8256, "Information", "Anzahl jetzt sichtbarer Items:" & @TAB & _GUICtrlComboBox_GetMinVisible($idCombo), 3)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
