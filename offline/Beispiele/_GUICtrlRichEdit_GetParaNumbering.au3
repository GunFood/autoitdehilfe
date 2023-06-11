#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsConstants.au3>

Global $g_idLblMsg, $g_hRichEdit

Example()

Func Example()
	Local $hGui, $iMsg, $idBtnNext, $iStep = 0
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$g_hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtnNext = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetText($g_hRichEdit, "Erster Absatz")
	_GUICtrlRichEdit_SetSel($g_hRichEdit, 0, 1)
	Report("Absatz mit den Standard-Eigenschaften")

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($g_hRichEdit) ; wird benötigt, da sonst das Skript abstürzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
			Case $iMsg = $idBtnNext
				$iStep += 1
				Switch $iStep
					Case 1
						_GUICtrlRichEdit_AppendText($g_hRichEdit, @CR & "Zweiter Absatz")
						_GUICtrlRichEdit_SetParaNumbering($g_hRichEdit, ".")
						Report("Füge einen zweiten Absatz hinzu")
					Case 2
						_GUICtrlRichEdit_SetSel($g_hRichEdit, 0, 2)
						Report("Aussehen des ersten Absatzes in der Auswahl")
					Case 3
						_GUICtrlRichEdit_SetSel($g_hRichEdit, 10, 26)
						_GUICtrlRichEdit_SetParaNumbering($g_hRichEdit, "v)  ", Default, True)
						Report("Ändere die Einstellungen beider Absätze")
					Case 4
						_GUICtrlRichEdit_SetSel($g_hRichEdit, 10, 26)
						_GUICtrlRichEdit_SetParaNumbering($g_hRichEdit, "2.  ", Default, True)
						Report("Ändere die Einstellungen beider Absätze")
					Case 5
						; Streamt den Text in eine Datei auf dem Desktop, um dessen Eigenschaften in Word ansehen zu können.
						_GUICtrlRichEdit_Deselect($g_hRichEdit)
						_GUICtrlRichEdit_StreamToFile($g_hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($idBtnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	$sMsg = $sMsg & @CR & @CR & " Die Rückgaben der Funktion " & @CR & _GUICtrlRichEdit_GetParaNumbering($g_hRichEdit)
	GUICtrlSetData($g_idLblMsg, $sMsg)
EndFunc   ;==>Report
