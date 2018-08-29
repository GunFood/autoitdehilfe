#include <Color.au3>
#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsConstants.au3>

Global $g_idLblMsg, $g_hRichEdit

Example()

Func Example()
	Local $hGui, $idBtnNext, $iStep = 0
	$hGui = GUICreate(StringTrimRight(@ScriptName, 4), 420, 350, -1, -1)
	$g_hRichEdit = _GUICtrlRichEdit_Create($hGui, 'Dies ist ein Test.', 10, 10, 400, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtnNext = GUICtrlCreateButton("Nächste", 270, 310, 60, 30)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($g_hRichEdit) ; wird benötigt, da sonst das Skript abstürzt
				GUIDelete()
				Exit
			Case $idBtnNext
				$iStep += 1
				Switch $iStep
					Case 1
						Report("1. Grundeinstellung")
					Case 2
						_GUICtrlRichEdit_SetSel($g_hRichEdit, 0, -1)
						_GUICtrlRichEdit_SetCharBkColor($g_hRichEdit, Dec('00FF00'))
						Report("2. Aktuelle Einstellung")
					Case 3
						_GUICtrlRichEdit_SetSel($g_hRichEdit, 1, 5)
						_GUICtrlRichEdit_SetCharBkColor($g_hRichEdit, Dec('8888FF'))
						Report("3. Hintergrund einiger Zeichen geändert")
					Case 4
						; Streamt den kompletten Text in eine Datei auf dem Desktop, so kann man die Einstellungen in Word ansehen
						_GUICtrlRichEdit_Deselect($g_hRichEdit)
						_GUICtrlRichEdit_StreamToFile($g_hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($idBtnNext, $GUI_DISABLE)
						GUICtrlSetData($g_idLblMsg, "4. Es wurde eine Datei namens gcre.rtf auf dem Desktop gespeichert")
				EndSwitch
		EndSwitch
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	Local $iColor = _GUICtrlRichEdit_GetCharBkColor($g_hRichEdit)
	Local $aRet = _ColorGetRGB($iColor)
	$sMsg &= @CRLF & @CRLF & $aRet[0] & ";" & $aRet[1] & ";" & $aRet[2] & " BkColor=0x" & Hex($iColor)
	GUICtrlSetData($g_idLblMsg, $sMsg)
EndFunc   ;==>Report
