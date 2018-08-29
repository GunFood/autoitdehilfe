#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui, $hCombo

	; Erstellt eine GUI
	$hGui = GUICreate("ComboBoxEx: Weist den ListBox-Items Speicher zu", 450, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGui, "", 2, 2, 446, 296, $CBS_SIMPLE)
	GUISetState(@SW_SHOW)

	MsgBox(8256, "Information", "Es wurde Speicher für: " & _GUICtrlComboBoxEx_InitStorage($hCombo, 150, 300) & " Items bereitgestellt!")
	_GUICtrlComboBoxEx_BeginUpdate($hCombo)

	For $x = 0 To 149
		_GUICtrlComboBoxEx_AddString($hCombo, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlComboBoxEx_EndUpdate($hCombo)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
