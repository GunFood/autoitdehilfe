#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsConstants.au3>

Global $g_idLblMsg, $g_hRichEdit

Example()

Func Example()
	Local $hGui, $iMsg, $idBtnDoIt
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$g_hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtnDoIt = GUICtrlCreateButton("Mach es", 260, 310, 50, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetSel($g_hRichEdit, 0, -1) ; select all

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($g_hRichEdit) ; wird benötigt, da sonst das Skript abstürzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
			Case $iMsg = $idBtnDoIt
				ChangeFontSize()
		EndSelect
	WEnd
EndFunc   ;==>Example

Func ChangeFontSize()
	Local $av, $iOld, $iNew
	$av = _GUICtrlRichEdit_GetFont($g_hRichEdit)
	$iOld = $av[0]
	_GUICtrlRichEdit_ChangeFontSize($g_hRichEdit, 2)
	$av = _GUICtrlRichEdit_GetFont($g_hRichEdit)
	$iNew = $av[0]
	Report("Vorher " & $iOld & " Punkt Schrift; jetzt " & $iNew & " Punkt Schrift")
EndFunc   ;==>ChangeFontSize

Func Report($sMsg)
	GUICtrlSetData($g_idLblMsg, $sMsg)
EndFunc   ;==>Report
