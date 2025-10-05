#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsStylesConstants.au3>

Global $g_idLbl_Msg, $g_hRichEdit

Example()

Func Example()
	Local $hGui = GUICreate("RichEdit Ermittelt bzw. setzt CharAttributes", 320, 350, -1, -1)
	$g_hRichEdit = _GUICtrlRichEdit_Create($hGui, "This is a test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLbl_Msg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	Local $idBtn_Next = GUICtrlCreateButton("Nächste", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetText($g_hRichEdit, "Paragraph 1 ")
	Local $iMsg, $iStep = 0
	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($g_hRichEdit) ; erforderlich, sofern das Skript nicht abstürzt
				; GUIDelete() 	; ist auch OK
				Exit
			Case $iMsg = $idBtn_Next
				$iStep += 1
				Switch $iStep
					Case 1
						_GUICtrlRichEdit_SetSel($g_hRichEdit, 0, 2)
						_GUICtrlRichEdit_SetCharAttributes($g_hRichEdit, "+un")
						Report("1. Zwei unterstrichene Zeichen")
					Case 2
						_GUICtrlRichEdit_SetSel($g_hRichEdit, 1, 5)
						_GUICtrlRichEdit_SetCharAttributes($g_hRichEdit, "+bo")
						Report("2. Einige Zeichen sind fett gedruckt.")
					Case 3
						; Alle Texte auf den Desktop streamen, damit Sie die Einstellungen in Word einsehen können
						_GUICtrlRichEdit_Deselect($g_hRichEdit)
						_GUICtrlRichEdit_StreamToFile($g_hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($idBtn_Next, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	$sMsg = $sMsg & @CRLF & @CRLF & _GUICtrlRichEdit_GetCharAttributes($g_hRichEdit)
	GUICtrlSetData($g_idLbl_Msg, $sMsg)
EndFunc   ;==>Report
