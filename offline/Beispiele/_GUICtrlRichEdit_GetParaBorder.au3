#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsStylesConstants.au3>

Global $g_idLbl_Msg, $g_hRichEdit

Example()

Func Example()
	Local $hGui, $iMsg, $iStep = 0, $idBtn_Next
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$g_hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLbl_Msg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtn_Next = GUICtrlCreateButton("Weiter", 250, 310, 60, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_AppendText($g_hRichEdit, "Erster Absatz")
	Report("0. Erster Absatz: Standardeinstellungen")

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
						_GUICtrlRichEdit_SetParaBorder($g_hRichEdit, "o", 3, "mag", 0.25)
						Report("1. Zweiter Absatz: mit Rand (sollte in Word angezeigt werden)")
					Case 2
						_GUICtrlRichEdit_SetSel($g_hRichEdit, 10, -1)
						Report("2. Einstellungen des ersten Absatzes in der Markierung")
					Case 3
						_GUICtrlRichEdit_SetParaBorder($g_hRichEdit, "l", 6, "blu")
						Report("3. Einstellungen beider Absätze geändert")
					Case 4
						_GUICtrlRichEdit_SetParaBorder($g_hRichEdit, Default, ".75gd")
						Report("4. Zeilenstil geändert")
					Case 5
						; Streamt den kompletten Text in eine Datei auf dem Desktop. Die Rändereinstellungen können in Word eingesehen werden
						_GUICtrlRichEdit_Deselect($g_hRichEdit)
						_GUICtrlRichEdit_StreamToFile($g_hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($idBtn_Next, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	$sMsg = $sMsg & @CR & @CR & "Funktionsrückgabe " & @CR & _GUICtrlRichEdit_GetParaBorder($g_hRichEdit)
	GUICtrlSetData($g_idLbl_Msg, $sMsg)
EndFunc   ;==>Report
