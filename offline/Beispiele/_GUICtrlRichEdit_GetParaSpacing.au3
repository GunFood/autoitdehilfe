#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsStylesConstants.au3>

Global $g_idLbl_Msg, $g_hRichEdit

Example()

Func Example()
	Local $hGui, $iMsg, $idBtn_Next, $iStep = 0
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$g_hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLbl_Msg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtn_Next = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetText($g_hRichEdit, "Erster Absatz")
	Report("0. Absatz mit den Standardeinstellungen")

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($g_hRichEdit) ; wird benötigt, da sonst das Skript abstürzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
			Case $iMsg = $idBtn_Next
				$iStep += 1
				Switch $iStep
					Case 1
						_GUICtrlRichEdit_AppendText($g_hRichEdit, @CR & "Zweiter Absatz")
						_GUICtrlRichEdit_SetParaSpacing($g_hRichEdit, "2 lines", .2, .25)
						Report("1. Der Abstand des zweiten Absatzes ist ")
					Case 2
						_GUICtrlRichEdit_SetSel($g_hRichEdit, 0, 2)
						Report("2. Die Einstellungen des ersten Absatzes in der Auswahl sind ")
					Case 3
						_GUICtrlRichEdit_SetSel($g_hRichEdit, 10, 26)
						_GUICtrlRichEdit_SetParaSpacing($g_hRichEdit, Default, .1)
						Report("3. Ändere den Abstand beider Absätze")
					Case 4
						; Streamt den Text in eine Datei auf dem Desktop, um dessen Eigenschaften in Word ansehen zu können.
						_GUICtrlRichEdit_Deselect($g_hRichEdit)
						_GUICtrlRichEdit_StreamToFile($g_hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($idBtn_Next, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	$sMsg = $sMsg & @CR & @CR & "Rückgaben der Funktion " & @CR & _GUICtrlRichEdit_GetParaSpacing($g_hRichEdit)
	GUICtrlSetData($g_idLbl_Msg, $sMsg)
EndFunc   ;==>Report
