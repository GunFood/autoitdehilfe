#include <DirConstants.au3>
#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui, $idCombo

	; Erstellt eine GUI
	$hGui = GUICreate("(UDF) ComboBox: Zerstören", 400, 296)
	$idCombo = _GUICtrlComboBox_Create($hGui, "", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBox_BeginUpdate($idCombo)
	_GUICtrlComboBox_AddDir($idCombo, "", $DDL_DRIVES, False)
	_GUICtrlComboBox_EndUpdate($idCombo)

	; Zerstört die ComboBox
	MsgBox($MB_SYSTEMMODAL, "Information", "ComboBox zerstören")
	MsgBox($MB_SYSTEMMODAL, "Information", "Zersört: " & _GUICtrlComboBox_Destroy($idCombo))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
