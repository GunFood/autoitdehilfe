#include <GuiComboBoxEx.au3>
#include <GuiConstantsEx.au3>

Example()

Func Example()
	Local $hGui, $hCombo

	; Erstellt eine GUI
	$hGui = GUICreate("ComboBoxEx: Verzeichnis hinzufügen", 400, 300, -1, -1, -1)
	$hCombo = _GUICtrlComboBoxEx_Create($hGui, "", 2, 2, 394, 100)
	GUICtrlCreateInput("Input control", 2, 30, 120)
	GUISetState(@SW_SHOW)

	; Fügt Dateien eines Verzeichnisses mittels _GUICtrlComboBoxEx_AddDir hinzu
	_GUICtrlComboBoxEx_BeginUpdate($hCombo)
	_GUICtrlComboBoxEx_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBoxEx_EndUpdate($hCombo)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
