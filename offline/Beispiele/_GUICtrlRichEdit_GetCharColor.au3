#include <Color.au3>
#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsConstants.au3>

Global $g_idLblMsg, $g_hRichEdit

Example()

Func Example()
	Local $hGui = GUICreate("RichEdit: Setzt und ermittelt die Farbe (v" & @AutoItVersion & ")", 420, 350, -1, -1)
	$g_hRichEdit = _GUICtrlRichEdit_Create($hGui, "", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	Local $idBtnNext = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetText($g_hRichEdit, "Absatz 1")
	Local $iMsg, $iStep = 0
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
						Report("1. Standard")
					Case 2
						_GUICtrlRichEdit_SetCharColor($g_hRichEdit, "304050")
						Report("2. Einstellungen jetzt")
					Case 3
						_GUICtrlRichEdit_SetSel($g_hRichEdit, 1, 5)
						_GUICtrlRichEdit_SetCharColor($g_hRichEdit)
						Report("3. Farbe einiger Zeichen geändert")
					Case 4
						; Zeichnet allen Text in einer Datei auf dem Desktop auf, um dessen Eigenschaften in Word anzuzeigen
						_GUICtrlRichEdit_Deselect($g_hRichEdit)
						_GUICtrlRichEdit_StreamToFile($g_hRichEdit, @DesktopDir & "\gcre.rtf")
						Report("4. In Datei gespeichert")
						GUICtrlSetState($idBtnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	Local $iColor = _GUICtrlRichEdit_GetCharColor($g_hRichEdit)
;~ 	Local $sMixed = _Iif(@extended, "Eine Farbe in der Auswahl", "Verschiedene Farben in der Auswahl")
	Local $sMixed = @extended
	Local $aRet = _ColorGetRGB($iColor)
	$sMsg = $sMsg & @CRLF & @CRLF & $aRet[0] & ";" & $aRet[1] & ";" & $aRet[2] & " Color=0x" & Hex($iColor)
	GUICtrlSetData($g_idLblMsg, $sMsg)
EndFunc   ;==>Report
