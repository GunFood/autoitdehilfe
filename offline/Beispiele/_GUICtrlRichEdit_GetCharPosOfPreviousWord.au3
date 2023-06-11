#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGui, $iMsg, $idBtnNext, $idLblMsg, $hRichEdit, $iCp = 200
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$idLblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtnNext = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_AppendText($hRichEdit, "AutoIt v3 ist eine kostenlose, BASIC-artige Skriptsprache, die für " _
			 & "die Automatisierung der Windows-Oberfläche und allgemeines Skripten entwickelt wurde.")

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($hRichEdit) ; wird benötigt, da sonst das Skript abstürzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
			Case $iMsg = $idBtnNext
				$iCp = _GUICtrlRichEdit_GetCharPosOfPreviousWord($hRichEdit, $iCp)
				GUICtrlSetData($idLblMsg, $iCp)
				_GUICtrlRichEdit_GotoCharPos($hRichEdit, $iCp)
		EndSelect
	WEnd
EndFunc   ;==>Example
