#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGUI, $hBtn, $hRdo, $hChk

	$hGUI = GUICreate("Buttons", 400, 400)
	$g_idMemo = GUICtrlCreateEdit("", 119, 10, 276, 374, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")

	$hBtn = _GUICtrlButton_Create($hGUI, "Button 1", 10, 10, 90, 50)

	$hRdo = _GUICtrlButton_Create($hGUI, "Radio 1", 10, 60, 90, 50, BitOR($BS_AUTORADIOBUTTON, $BS_NOTIFY))

	$hChk = _GUICtrlButton_Create($hGUI, "Check 1", 10, 120, 90, 50, BitOR($BS_AUTO3STATE, $BS_NOTIFY))

	GUISetState(@SW_SHOW)

	MemoWrite("$idBtn Handle: " & $hBtn)
	MemoWrite("$idRdo Handle: " & $hRdo)
	MemoWrite("$idChk Handle: " & $hChk & @CRLF)

	MsgBox($MB_SYSTEMMODAL, "Information", "Darüber, wie Buttons zerstört werden")

	Send("^{END}")

	MemoWrite("Zerstört $idBtn: " & _GUICtrlButton_Destroy($hBtn))
	MemoWrite("Zerstört $idRdo: " & _GUICtrlButton_Destroy($hRdo))
	MemoWrite("Zerstört $idChk: " & _GUICtrlButton_Destroy($hChk) & @CRLF)

	MemoWrite("$idBtn Handle: " & $hBtn)
	MemoWrite("$idRdo Handle: " & $hRdo)
	MemoWrite("$idChk Handle: " & $hChk & @CRLF)

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
