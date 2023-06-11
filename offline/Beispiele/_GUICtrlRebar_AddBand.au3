#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <GuiDateTimePicker.au3>
#include <GuiReBar.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGui, $idBtnExit, $hCombo, $hReBar, $hDTP, $idInput

	$hGui = GUICreate("Rebar", 400, 396, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_MAXIMIZEBOX))

	; Erstellt ein Rebar-Control
	$hReBar = _GUICtrlRebar_Create($hGui, BitOR($CCS_TOP, $WS_BORDER, $RBS_VARHEIGHT, $RBS_AUTOSIZE, $RBS_BANDBORDERS))

	; Erstellt eine Combobox in der Rebar
	$hCombo = _GUICtrlComboBox_Create($hGui, "", 0, 0, 120)

	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Erstellt ein DTP in der Rebar
	$hDTP = _GUICtrlDTP_Create($hGui, 0, 0, 190)

	; Erstellt eine Inputbox in der Rebar
	$idInput = GUICtrlCreateInput("Input-Control", 0, 0, 120, 20)

	; Fügt eine Gruppe mit Controls ein
	_GUICtrlRebar_AddBand($hReBar, $hCombo, 120, 200, "Dir *.exe")

	; Hinzufügen und in die zweite Zeile
	_GUICtrlRebar_AddBand($hReBar, $hDTP, 120)
	_GUICtrlRebar_SetBandStyleBreak($hReBar, 1)

	; Am Anfang der Rebar hinzufügen
	_GUICtrlRebar_AddBand($hReBar, GUICtrlGetHandle($idInput), 120, 200, "Name:", 0)

	$idBtnExit = GUICtrlCreateButton("Exit", 150, 360, 100, 25)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idBtnExit
				Exit
		EndSwitch
	WEnd
EndFunc   ;==>Example
