#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("ComboBox: Setzt und ermittelt den horizontalen Scrollbereich (v" & @AutoItVersion & ")", 620, 296)
	Local $idCombo = GUICtrlCreateCombo("", 2, 2, 416, 296, BitOR($CBS_SIMPLE, $CBS_DISABLENOSCROLL, $WS_HSCROLL))
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Ermittelt den horizontalen Scrollbereich
	MsgBox($MB_SYSTEMMODAL, "Information", "Horizontaler Scrollbereich: " & _GUICtrlComboBox_GetHorizontalExtent($idCombo))

	; Setzt den horizontalen Scrollbereich
	_GUICtrlComboBox_SetHorizontalExtent($idCombo, 500)

	; Ermittelt den horizontalen Scrollbereich
	MsgBox($MB_SYSTEMMODAL, "Information", "Horizontaler Scrollbereich: " & _GUICtrlComboBox_GetHorizontalExtent($idCombo))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
