#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("ComboBox: Setzt und ermittelt die minimale Anzahl von sichtbaren Itemse (v" & @AutoItVersion & ")", 700, 296)
	Local $idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Ermittelt die minimale Anzahl von sichtbaren Items
	MsgBox($MB_SYSTEMMODAL, "Information", "Minimale Anzahl von sichtbaren Items:" & @TAB & _GUICtrlComboBox_GetMinVisible($idCombo), 3)

	; Zeigt das Dropdown
	_GUICtrlComboBox_ShowDropDown($idCombo, True)

	Sleep(1000)

	; Setzt die minimale Anzahl von sichtbaren Items
	_GUICtrlComboBox_SetMinVisible($idCombo, 50)

	; Zeigt die Aufklappliste
	_GUICtrlComboBox_ShowDropDown($idCombo)

	Sleep(1000)

	_GUICtrlComboBox_ShowDropDown($idCombo, True)

	Sleep(1000)

	; Ermittelt die minimale Anzahl von sichtbaren Items
	MsgBox($MB_SYSTEMMODAL, "Information", "Minimale Anzahl von sichtbaren Items:" & @TAB & _GUICtrlComboBox_GetMinVisible($idCombo), 3)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
