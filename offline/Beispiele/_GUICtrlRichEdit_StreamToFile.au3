#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGui, $hRichEdit, $iMsg
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, StringLen(".exe")) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Das ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_AppendText($hRichEdit, "Absatz mit Standard Randeinstellung ")
	MsgBox($MB_SYSTEMMODAL, "", "Die Standard Randeinstellungen für den Absatz sind " & _GUICtrlRichEdit_GetParaBorder($hRichEdit))

	_GUICtrlRichEdit_AppendText($hRichEdit, @CR & "Zweiter Absatz")
	_GUICtrlRichEdit_SetParaBorder($hRichEdit, "o", 3, "mag", 0.25)
	MsgBox($MB_SYSTEMMODAL, "", "Randeinstellung für den 2. Absatz sind " & _GUICtrlRichEdit_GetParaBorder($hRichEdit))

	_GUICtrlRichEdit_SetSel($hRichEdit, 10, -1)
	Sleep(1000)
	MsgBox($MB_SYSTEMMODAL, "", "Randeinstellungen für den ersten Absatz der Auswahl sind " & _GUICtrlRichEdit_GetParaBorder($hRichEdit))

	;  Wechsel von Aussenbegrenzung  zu Linksbegrenzung
	_GUICtrlRichEdit_SetParaBorder($hRichEdit, "l")

	; Legt eine Datei auf dem Desktop an, damit man sich die Randeinstellungen in Word ansehen kann
	_GUICtrlRichEdit_Deselect($hRichEdit)
	_GUICtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($hRichEdit) ; wird benötigt, da sonst das Skript abstürzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
		EndSelect
	WEnd
EndFunc   ;==>Example
