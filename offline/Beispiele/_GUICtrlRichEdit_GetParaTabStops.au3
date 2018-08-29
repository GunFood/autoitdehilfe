#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsConstants.au3>

Global $g_idLblMsg, $g_hRichEdit

Example()

Func Example()
	Local $hGui, $iMsg, $idBtnNext, $iStep = 0
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 370, 350, -1, -1)
	$g_hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 350, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtnNext = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetText($g_hRichEdit, "Erster Absatz")
	Report("0. Absatz mit Standardeinstellungen")

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
						_GUICtrlRichEdit_SetParaTabStops($g_hRichEdit, ".3l ;1c ;2.5r.")
						Report("1. Tabstopps des zweiten Absatzes")
					Case 2
						_GUICtrlRichEdit_SetSel($g_hRichEdit, 0, 2)
						Report("2. Tabstopps des ersten Absatzes")
					Case 3
						_GUICtrlRichEdit_SetSel($g_hRichEdit, 10, 26)
						Report("Tabstopps des ersten Absatzes in der Auswahl")
					Case 4
						_GUICtrlRichEdit_SetParaTabStops($g_hRichEdit, "2.3r=")
						Report("3. Ändere die Tabstopps beider Absätze")
					Case 5
						; Schreibt den Text in eine Datei auf dem Desktop, um die Einstellungen in Word anschauen zu können
						_GUICtrlRichEdit_Deselect($g_hRichEdit)
						_GUICtrlRichEdit_StreamToFile($g_hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($idBtnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	$sMsg = $sMsg & @CR & @CR & "Rückgabewerte von _GetParaTabStops: " & @CR & _GUICtrlRichEdit_GetParaTabStops($g_hRichEdit)
	GUICtrlSetData($g_idLblMsg, $sMsg)
EndFunc   ;==>Report
