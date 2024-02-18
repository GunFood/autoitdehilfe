#include <GuiRichEdit.au3>

Local $sText = "Erste Zeile" & @CR & @CR & "Letzt Zeile" & @CR
Local $iStart, $iEnd, $sLine, $i
Local $iTextLen
Local $iFindTextError, $iGetTextError
Local $sMsgBuff = ""

Local $hGUI = GUICreate("Text finden Test", 300, 300)
Local $hRichEdit = _GUICtrlRichEdit_Create($hGUI, "", 10, 10, 280, 280)
GUISetState(@SW_SHOW, $hGUI)

_GUICtrlRichEdit_SetText($hRichEdit, $sText)
$iStart = 0
$iTextLen = _GUICtrlRichEdit_GetTextLength($hRichEdit, True, True)
$sMsgBuff = $iTextLen & " Zeichen in Rich Edit Box"

For $i = 1 To 6
	If Not _GUICtrlRichEdit_GotoCharPos($hRichEdit, $iStart) Then
;~ 		MsgBox(0, "", "False von GotoCharPos")
		ExitLoop
	EndIf
	$iEnd = _GUICtrlRichEdit_FindText($hRichEdit, @CR) ; Findet die nächste CR
	If $iEnd = -1 Then ExitLoop
	$iFindTextError = @error
	If $iEnd = $iStart Then
		$sLine = "" ; end = Start bedeutet einfach eine Leerzeile
		$iGetTextError = 0
	Else
		$sLine = _GUICtrlRichEdit_GetTextInRange($hRichEdit, $iStart, $iEnd) ; die Zeile besteht aus allen Zeichen zwischen Anfang und Ende
		$iGetTextError = @error
	EndIf
	$sMsgBuff &= @CRLF & $i & ": Start = " & $iStart & ", Ende = " & $iEnd & ": <" & $sLine & ">  (@errors = " & $iFindTextError & ", " & $iGetTextError & ")" ; Ergebnisse kumulieren
	$iStart = $iEnd + 1 ; Die nächste Suche beginnt ein Zeichen nach dem zuletzt gefundenen CR
Next
MsgBox(0, "Test Ergebnisse", $sMsgBuff)
_GUICtrlRichEdit_Destroy($hRichEdit)
GUIDelete($hGUI)
Exit
