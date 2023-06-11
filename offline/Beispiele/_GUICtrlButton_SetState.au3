#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $idRdo, $idRdo2, $idChk, $idChk2, $idChk3, $idBtn, $idBtn2

	GUICreate("Buttons", 800, 400)
	$g_idMemo = GUICtrlCreateEdit("", 119, 10, 676, 374, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")

	$idBtn = GUICtrlCreateButton("Button 1", 10, 10, 90, 25)
	_GUICtrlButton_SetState($idBtn)

	$idBtn2 = GUICtrlCreateButton("Button 2", 10, 60, 90, 25)

	$idRdo = GUICtrlCreateRadio("Radio 1", 10, 110, 90, 25)
	_GUICtrlButton_SetFocus($idRdo)

	$idRdo2 = GUICtrlCreateRadio("Radio 2", 10, 150, 90, 25)
	_GUICtrlButton_SetCheck($idRdo2)

	$idChk = GUICtrlCreateCheckbox("Check 1", 10, 195, 90, 25, BitOR($BS_AUTO3STATE, $BS_NOTIFY))
	_GUICtrlButton_SetCheck($idChk, $BST_INDETERMINATE)

	$idChk2 = GUICtrlCreateCheckbox("Check 2", 10, 240, 90, 25, BitOR($BS_AUTO3STATE, $BS_NOTIFY))

	$idChk3 = GUICtrlCreateCheckbox("Check 3", 10, 285, 90, 25, BitOR($BS_AUTO3STATE, $BS_NOTIFY))
	_GUICtrlButton_SetCheck($idChk3, $BST_CHECKED)

	GUISetState(@SW_SHOW)

	MemoWrite("Button 1 Status:" & _
			_ExplainState(_GUICtrlButton_GetState($idBtn), True) & "--------------------------------")
	MemoWrite("Button 2 Status:" & _
			_ExplainState(_GUICtrlButton_GetState($idBtn2), True) & "--------------------------------")
	MemoWrite("Radio 1 Status: " & _
			_ExplainState(_GUICtrlButton_GetState($idRdo)) & "--------------------------------")
	MemoWrite("Radio 2 Status: " & _
			_ExplainState(_GUICtrlButton_GetState($idRdo2)) & "--------------------------------")
	MemoWrite("Check 1 Status: " & _
			_ExplainState(_GUICtrlButton_GetState($idChk)) & "--------------------------------")
	MemoWrite("Check 2 Status: " & _
			_ExplainState(_GUICtrlButton_GetState($idChk2)) & "--------------------------------")
	MemoWrite("Check 3 Status: " & _
			_ExplainState(_GUICtrlButton_GetState($idChk3)) & "--------------------------------")

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

Func _ExplainState($iState, $bPushButton = False)
	Local $sText = ""
	If Not $bPushButton And Not $iState Then Return _
			@CRLF & "Der Button ist nicht markiert (gleiches Ergebnis wie Rückgabewert 0)." & @CRLF
	If BitAND($iState, $BST_CHECKED) = $BST_CHECKED Then _
			$sText &= @CRLF & "Der Button ist markiert." & @CRLF
	If BitAND($iState, $BST_FOCUS) = $BST_FOCUS Then _
			$sText &= @CRLF & "Der Button ist fokussiert (ein Wert >< 0 besagt, dass der Button den Eingabefokus hat)." & @CRLF
	If BitAND($iState, $BST_INDETERMINATE) = $BST_INDETERMINATE Then _
			$sText &= @CRLF & "Der Button ist ausgegraut, weil der Status des Buttons unbestimmt ist." & @CRLF
	If $bPushButton Then
		If BitAND($iState, $BST_PUSHED) = $BST_PUSHED Then
			$sText &= @CRLF & "Der Button ist ausgewählt." & @CRLF
		Else
			$sText &= @CRLF & "Der Button ist nicht ausgewählt." & @CRLF
		EndIf
	EndIf
	Return $sText
EndFunc   ;==>_ExplainState
