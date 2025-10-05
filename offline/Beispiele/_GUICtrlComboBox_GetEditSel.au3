#include "Extras\HelpFileInternals.au3"

#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("ComboBox: Setzt und ermittelt den String (v" & @AutoItVersion & ")", 500, 296)
	Local $idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	_MemoCreate(2, 32, 396, 266, 0)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Wählt ein Item aus
	_GUICtrlComboBox_SetCurSel($idCombo, 2)

	; Wählt Zeichen im Input-Control einer ComboBox aus
	_GUICtrlComboBox_SetEditSel($idCombo, 0, 4)

	; Ermittelt Zeichen im Input-Control einer ComboBox
	Local $aSel = _GUICtrlComboBox_GetEditSel($idCombo)
	_MemoWrite(StringFormat("Ermittelt Zeichen im Input-Control einer ComboBox: %d - %d", $aSel[0], $aSel[1]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example