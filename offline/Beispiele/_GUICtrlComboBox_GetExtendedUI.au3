#include "Extras\HelpFileInternals.au3"

#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("ComboBox: Setzt die erweiterte Benutzeroberfläche und ermittelt, ob die erweiterte Benutzeroberfläche verwendet wird (v" & @AutoItVersion & ")", 900, 296)
	Local $idCombo = GUICtrlCreateCombo("", 2, 2, 396, 296)
	_MemoCreate(2, 32, 396, 266, 0)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Ermittelt, ob die erweiterte Benutzeroberfläche verwendet wird
	_MemoWrite("Erweiterte Benutzeroberfläche: " & _GUICtrlComboBox_GetExtendedUI($idCombo))

	; Setzt die erweiterte Benutzeroberfläche
	_GUICtrlComboBox_SetExtendedUI($idCombo, True)

	; Ermittelt, ob die erweiterte Benutzeroberfläche verwendet wird
	_MemoWrite("Erweiterte Benutzeroberfläche: " & _GUICtrlComboBox_GetExtendedUI($idCombo))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example