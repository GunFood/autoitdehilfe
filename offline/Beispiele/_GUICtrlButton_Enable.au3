#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $idRdo, $idRdo2, $idChk

	GUICreate("Buttons", 400, 400)
	$g_idMemo = GUICtrlCreateEdit("", 119, 10, 276, 374, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")

	$idRdo = GUICtrlCreateRadio("Radio1", 10, 10, 90, 50)

	$idRdo2 = GUICtrlCreateRadio("Radio2", 10, 60, 90, 50)
	_GUICtrlButton_SetCheck($idRdo2)

	$idChk = GUICtrlCreateCheckbox("Check1", 10, 120, 90, 50, BitOR($BS_AUTO3STATE, $BS_NOTIFY))
	_GUICtrlButton_SetCheck($idChk, $BST_INDETERMINATE)

	GUISetState(@SW_SHOW)

	MemoWrite("Deaktiviert Button: " & _GUICtrlButton_Enable($idRdo2, False))
	Sleep(1000)
	MemoWrite("Deaktiviert Button: " & _GUICtrlButton_Enable($idRdo2))

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idRdo
				MemoWrite("$idRdo angeklickt")
			Case $idRdo2
				MemoWrite("$idRdo2 angeklickt")
			Case $idChk
				MemoWrite("$idChk angeklickt")
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
