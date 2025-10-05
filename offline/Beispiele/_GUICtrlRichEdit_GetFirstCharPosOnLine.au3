#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsStylesConstants.au3>

Global $g_idLbl_Msg
Example()

Func Example()
	Local $hGui, $hRichEdit, $iLastLineNumber, $iCharPosition, $iMsg
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, StringLen(".exe")) & ")", 520, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 500, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLbl_Msg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_AutoDetectURL($hRichEdit, True)
	_GUICtrlRichEdit_AppendText($hRichEdit, @CR & "http://www.autoitscript.com")

	$iLastLineNumber = _GUICtrlRichEdit_GetLineCount($hRichEdit)

	; Ermittelt die erste Zeichenposition der letzten Zeile
	$iCharPosition = _GUICtrlRichEdit_GetFirstCharPosOnLine($hRichEdit, $iLastLineNumber)

	; Whält 4 Zeichen aus - sollte das Wort "http" sein
	_GUICtrlRichEdit_SetSel($hRichEdit, $iCharPosition, $iCharPosition + 4)
	Report("Die Zeicheneigenschaften am Anfang der Zeile sind " & $iLastLineNumber & _
			_GUICtrlRichEdit_GetCharAttributes($hRichEdit))

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($hRichEdit) ; wird benötigt, da sonst das Skript abstürzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	GUICtrlSetData($g_idLbl_Msg, $sMsg)
EndFunc   ;==>Report
