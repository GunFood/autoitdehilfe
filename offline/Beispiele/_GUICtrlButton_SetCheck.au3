#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $idRdo1, $idRdo2, $idChk

	GUICreate("Buttons", 600, 300)
	$g_idMemo = GUICtrlCreateEdit("", 99, 10, 496, 274, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")

	$idRdo1 = GUICtrlCreateRadio("Radiobutton 1", 5, 13, 90, 50)

	$idRdo2 = GUICtrlCreateRadio("Radiobutton 2", 5, 58, 90, 50)
	_GUICtrlButton_SetCheck($idRdo2)
	_GUICtrlButton_SetFocus($idRdo2) ; Hier wird der Fokus auf den 2. Radiobutton gesetzt, um zu zeigen, dass das keine Auswirkungen auf _GUICtrlButton_GetCheck hat.

	$idChk = GUICtrlCreateCheckbox("Checkbox 1", 5, 103, 90, 50, BitOR($BS_AUTO3STATE, $BS_NOTIFY))
	_GUICtrlButton_SetCheck($idChk, $BST_UNCHECKED)

	GUISetState(@SW_SHOW)

	MemoWrite(@CRLF) ; Zeilenumbruch einfügen
	MemoWrite("Variable $idRdo1 wurde geprüft." & @CRLF & " Zustand: " & _ExplainCheckState(_GUICtrlButton_GetCheck($idRdo1)) & @CRLF)
	MemoWrite("Variable $idRdo2 wurde geprüft." & @CRLF & " Zustand: " & _ExplainCheckState(_GUICtrlButton_GetCheck($idRdo2)) & @CRLF)
	MemoWrite("Variable $idChk1 wurde geprüft." & @CRLF & " Zustand: " & _ExplainCheckState(_GUICtrlButton_GetCheck($idChk)) & @CRLF)

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

Func _ExplainCheckState($iState)
	Switch $iState
		Case $BST_CHECKED
			Return "Button ist gesetzt."
		Case $BST_INDETERMINATE
			Return "Button ist ausgegraut und zeigt damit an, dass sein" & @CRLF & "          Zustand unbestimmt ist (gilt nur, wenn der Button im" & @CRLF & "          Stil $BS_3STATE oder $BS_AUTO3STATE erstellt wurde)."
		Case $BST_UNCHECKED
			Return "Button ist nicht gesetzt"
	EndSwitch
EndFunc   ;==>_ExplainCheckState
