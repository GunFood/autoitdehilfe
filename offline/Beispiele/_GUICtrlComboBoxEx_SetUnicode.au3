#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui, $hCombo

	; Erstellt eine GUI
	$hGui = GUICreate("ComboBoxEx: Ermittelt/setzt Unicode", 400, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGui, "", 2, 2, 394, 100, $CBS_SIMPLE)
	GUISetState(@SW_SHOW)

	_GUICtrlComboBoxEx_InitStorage($hCombo, 150, 300)
	_GUICtrlComboBoxEx_BeginUpdate($hCombo)

	For $x = 0 To 149
		_GUICtrlComboBoxEx_AddString($hCombo, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlComboBoxEx_EndUpdate($hCombo)

	; Ermittelt/Setzt Unicode
	MsgBox($MB_SYSTEMMODAL, "Information", "Setzt Unicode: " & _GUICtrlComboBoxEx_SetUnicode($hCombo, False))
	MsgBox($MB_SYSTEMMODAL, "Information", "Ermittelt Unicode: " & _GUICtrlComboBoxEx_GetUnicode($hCombo))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
