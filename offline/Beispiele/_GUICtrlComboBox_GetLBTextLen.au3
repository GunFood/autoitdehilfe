#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idCombo

	; Erstellt eine GUI
	GUICreate("ComboBox: Ermittelt die Textlänge eines ListBox-Eintrags", 450, 296)
	$idCombo = GUICtrlCreateCombo("", 2, 2, 446, 296)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Ermittelt die Text-Länge des 3. Eintrags in der Listbox
	MsgBox($MB_SYSTEMMODAL, "Information", "Länge des Textes im 3. ListBox-Eintrag: " & _GUICtrlComboBox_GetLBTextLen($idCombo, 2))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
