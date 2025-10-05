#include "Extras\HelpFileInternals.au3"

#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $tRECT, $idCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ermittelt die Bildschirmkoordinaten in seinem aufgeklappten Zustand", 650, 296)
	$idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	_MemoCreate(2, 32, 396, 266, 0)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Ermittelt die Bildschirmkoordinaten in seinem aufgeklappten Zustand
	$tRECT = _GUICtrlComboBox_GetDroppedControlRectEx($idCombo)

	_MemoWrite("X-Koordinate der oberen linken Ecke .......: " & DllStructGetData($tRECT, "Left"))
	_MemoWrite("Y-Koordinate der oberen linken Ecke .......: " & DllStructGetData($tRECT, "Top"))
	_MemoWrite("X-Koordinate der unteren rechten Ecke .....: " & DllStructGetData($tRECT, "Right"))
	_MemoWrite("Y-Koordinate der unteren rechten Ecke .....: " & DllStructGetData($tRECT, "Bottom"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example