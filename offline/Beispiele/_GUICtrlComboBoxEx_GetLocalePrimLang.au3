#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui, $hCombo

	; Erstellt eine GUI
	$hGui = GUICreate("ComboBoxEx: Extrahiert die primäre Sprach-ID von einer Sprach-ID", 550, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGui, "", 2, 2, 394, 100)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlComboBoxEx_AddDir($hCombo, "", $DDL_DRIVES, False)

	; Zeigt: Gebietsschema, Ländercode, Sprach-ID, primäre Sprach-ID, Sub-Sprachen-ID
	MsgBox($MB_SYSTEMMODAL, "Information", _
			"Gebietsschema .....: " & _GUICtrlComboBoxEx_GetLocale($hCombo) & @CRLF & _
			"Ländercode .........: " & _GUICtrlComboBoxEx_GetLocaleCountry($hCombo) & @CRLF & _
			"Sprach-ID............: " & _GUICtrlComboBoxEx_GetLocaleLang($hCombo) & @CRLF & _
			"primäre Sprach-ID..: " & _GUICtrlComboBoxEx_GetLocalePrimLang($hCombo) & @CRLF & _
			"Sub-Sprachen-ID....: " & _GUICtrlComboBoxEx_GetLocaleSubLang($hCombo))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
