#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui, $hCombo

	; Erstellt ein GUI
	$hGui = GUICreate("ComboBoxEx: Control zerstören", 400, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGui, "Dies ist ein Test|Zeile 2", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	_GUICtrlComboBoxEx_AddString($hCombo, "Noch mehr Text")
	_GUICtrlComboBoxEx_InsertString($hCombo, "Eingefügter Text", 1)

	; Zerstört das Control
	MsgBox(266256, "Information", "Zerstört das Control")
	_GUICtrlComboBoxEx_Destroy($hCombo)


	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst..
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
