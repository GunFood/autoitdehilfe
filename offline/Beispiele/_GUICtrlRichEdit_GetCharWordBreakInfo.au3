#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <SendMessage.au3>
#include <WindowsConstants.au3>

Global $g_idLblMsg

Example()

Func Example()
	Local $hGui, $iMsg, $idBtnNext, $hRichEdit, $iCp = -1, $s
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$g_idLblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$idBtnNext = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	$s = Chr(9)
	For $i = 32 To 126
		$s &= Chr($i)
	Next
	_GUICtrlRichEdit_AppendText($hRichEdit, $s & @CR)
	_GUICtrlRichEdit_AppendText($hRichEdit, "AutoIt v3 ist eine BASIC-ähnliche Freeware-Skriptsprache, die entwickelt wurde, um Skripte zu programmieren " _
			 & "und um die Windows-GUI zu automatisieren.")
	_GUICtrlRichEdit_AppendText($hRichEdit, @CRLF & "Ein weiterer Absatz")
	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($hRichEdit) ; wird benötigt, da sonst das Skript abstürzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
			Case $iMsg = $idBtnNext
				$iCp += 1
				_GUICtrlRichEdit_GotoCharPos($hRichEdit, $iCp)
				GUICtrlSetData($g_idLblMsg, _GUICtrlRichEdit_GetCharWordBreakInfo($hRichEdit, $iCp))
		EndSelect
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	GUICtrlSetData($g_idLblMsg, $sMsg)
EndFunc   ;==>Report

Func GetWord($hWnd, $iCp, $fForward, $fStartOfWord, $fClass = False)
	Local $iRet, $wParam
	If $fClass Then
		If $fForward Then
			$wParam = $WB_MOVEWORDRIGHT
		Else
			$wParam = $WB_MOVEWORDLEFT
		EndIf
	Else
		If $fForward Then
			If $fStartOfWord Then
				$wParam = $WB_RIGHT
			Else
				$wParam = $WB_LEFT
			EndIf
		Else
			If $fStartOfWord Then
				$wParam = $WB_RIGHTBREAK
			Else
				$wParam = $wb_LEFTBREAK
			EndIf
		EndIf
	EndIf
	$iRet = _SendMessage($hWnd, $EM_FINDWORDBREAK, $wParam, $iCp)
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $wParam = ' & $wParam & @CRLF & '>Fehlercode: ' & @error & @CRLF) ;### Debug Console
	Return $iRet
EndFunc   ;==>GetWord
