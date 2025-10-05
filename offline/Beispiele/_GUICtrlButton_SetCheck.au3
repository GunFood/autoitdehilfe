#include "Extras\HelpFileInternals.au3"

#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $idRdo1, $idRdo2, $idChk

	GUICreate("Buttons", 600, 300)
	_MemoCreate(119, 10, 276, 374, $WS_VSCROLL)

	$idRdo1 = GUICtrlCreateRadio("Radiobutton 1", 5, 13, 90, 50)

	$idRdo2 = GUICtrlCreateRadio("Radiobutton 2", 5, 58, 90, 50)
	_GUICtrlButton_SetCheck($idRdo2)
	_GUICtrlButton_SetFocus($idRdo2) ; Hier wird der Fokus auf den 2. Radiobutton gesetzt, um zu zeigen, dass das keine Auswirkungen auf _GUICtrlButton_GetCheck hat.

	$idChk = GUICtrlCreateCheckbox("Checkbox 1", 5, 103, 90, 50, BitOR($BS_AUTO3STATE, $BS_NOTIFY))
	_GUICtrlButton_SetCheck($idChk, $BST_UNCHECKED)

	GUISetState(@SW_SHOW)

	_MemoWrite(@CRLF) ; Zeilenumbruch einfügen
	_MemoWrite("Variable $idRdo1 wurde geprüft." & @CRLF & " Zustand: " & _ExplainCheckState(_GUICtrlButton_GetCheck($idRdo1)) & @CRLF)
	_MemoWrite("Variable $idRdo2 wurde geprüft." & @CRLF & " Zustand: " & _ExplainCheckState(_GUICtrlButton_GetCheck($idRdo2)) & @CRLF)
	_MemoWrite("Variable $idChk1 wurde geprüft." & @CRLF & " Zustand: " & _ExplainCheckState(_GUICtrlButton_GetCheck($idChk)) & @CRLF)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example

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
