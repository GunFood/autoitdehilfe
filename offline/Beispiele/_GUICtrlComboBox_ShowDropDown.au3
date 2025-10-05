#include "Extras\HelpFileInternals.au3"

#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $idCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Zeigt die ListBox", 400, 296)
	$idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	_MemoCreate(2, 32, 396, 266, 0)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Ermittelt, ob die ListBox der ComboBox aufgeklappt ist
	_MemoWrite("Status des Dropdowns......: " & _GUICtrlComboBox_GetDroppedState($idCombo))

	Sleep(500)

	; Zeigt die ListBox
	_GUICtrlComboBox_ShowDropDown($idCombo, True)

	Sleep(500)

	; Ermittelt, ob die ListBox der ComboBox aufgeklappt ist
	_MemoWrite("Status des Dropdowns......: " & _GUICtrlComboBox_GetDroppedState($idCombo))

	Sleep(500)

	; Versteckt die ListBox
	_GUICtrlComboBox_ShowDropDown($idCombo)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example