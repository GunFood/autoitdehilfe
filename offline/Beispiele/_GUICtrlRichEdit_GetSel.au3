#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsStylesConstants.au3>

Global $g_idLbl_Msg, $g_hRichEdit

Example()

Func Example()
	Local $hGui = GUICreate("RichEdit: Setzt und ermittelt die Position einer Auswahl (v" & @AutoItVersion & ")", 520, 350, -1, -1)
	$g_hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL, $ES_NOHIDESEL))
	$g_idLbl_Msg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	Local $idBtn_Next = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	Local $iMsg, $iStep = 0, $iCp1

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
						_GUICtrlRichEdit_SetSel($g_hRichEdit, 0, 3)
						Report("1. Initiale Zeichenattribute am Anfang von Zeile 1 sind")
					Case 2
						_GUICtrlRichEdit_AutoDetectURL($g_hRichEdit, True)
						_GUICtrlRichEdit_AppendText($g_hRichEdit, @CRLF & "http://www.autoitscript.com")
						$iCp1 = _GUICtrlRichEdit_GetFirstCharPosOnLine($g_hRichEdit, 2)
						_GUICtrlRichEdit_SetSel($g_hRichEdit, $iCp1, $iCp1 + 3)
						Report("2. Zeichenattribute am Anfang von Zeile 2 sind")
						GUICtrlSetState($idBtn_Next, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	Local $sRet = _GUICtrlRichEdit_GetCharAttributes($g_hRichEdit)
	$sMsg = $sMsg & @CRLF & @CRLF & "Char Attributes=" & $sRet
	GUICtrlSetData($g_idLbl_Msg, $sMsg)
EndFunc   ;==>Report
