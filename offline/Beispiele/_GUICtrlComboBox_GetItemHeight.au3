#include "Extras\HelpFileInternals.au3"

#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>


Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("ComboBox: Setzt und ermittelt die Höhe eines Items (v" & @AutoItVersion & ")", 500, 296)
	Local $idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	_MemoCreate(2, 32, 396, 266, 0)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Ermittelt die Höhe des Items (Auswahlfeld)
	_MemoWrite("Item Höhe (Auswahlfeld): " & _GUICtrlComboBox_GetItemHeight($idCombo))

	; Ermittelt die Höhe des Items (in der Liste)
	_MemoWrite("Item Höhe (in der Liste): " & _GUICtrlComboBox_GetItemHeight($idCombo, 0))

	; Setzt die Höhe des Items (Auswahlfeld)
	_GUICtrlComboBox_SetItemHeight($idCombo, 18)

	; Setzt die Höhe des Items (in der Liste)
	_GUICtrlComboBox_SetItemHeight($idCombo, 20, 0)

	; Ermittelt die Höhe des Items (Auswahlfeld)
	_MemoWrite("Item Höhe (Auswahlfeld): " & _GUICtrlComboBox_GetItemHeight($idCombo))

	; Ermittelt die Höhe des Items (in der Liste)
	_MemoWrite("Item Höhe (in der Liste): " & _GUICtrlComboBox_GetItemHeight($idCombo, 0))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example