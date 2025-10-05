#include "Extras\HelpFileInternals.au3"

#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $aRect, $idCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ermittelt die Bildschirmkoordinaten im ausgeklappten Zustand", 530, 296)
	$idCombo = GUICtrlCreateCombo("", 2, 2, 526, 296)
	_MemoCreate(2, 32, 396, 266, 0)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Ermittelt die Bildschirmkoordinaten der Combobox mit ausgeklappter Listbox
	$aRect = _GUICtrlComboBox_GetDroppedControlRect($idCombo)
	_MemoWrite("X-Koordinate der oberen linken Ecke ......: " & $aRect[0])
	_MemoWrite("Y-Koordinate der oberen linken Ecke ......: " & $aRect[1])
	_MemoWrite("X-Koordinate der unteren rechten Ecke ....: " & $aRect[2])
	_MemoWrite("Y-Koordinate der unteren rechten Ecke ....: " & $aRect[3])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example