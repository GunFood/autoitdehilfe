#include "Extras\HelpFileInternals.au3"

#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGUI, $hBtn, $hRdo, $hChk

	$hGUI = GUICreate("Buttons", 400, 400)
	_MemoCreate(119, 10, 276, 374, $WS_VSCROLL)

	$hBtn = _GUICtrlButton_Create($hGUI, "Button 1", 10, 10, 90, 50)

	$hRdo = _GUICtrlButton_Create($hGUI, "Radio 1", 10, 60, 90, 50, BitOR($BS_AUTORADIOBUTTON, $BS_NOTIFY))

	$hChk = _GUICtrlButton_Create($hGUI, "Check 1", 10, 120, 90, 50, BitOR($BS_AUTO3STATE, $BS_NOTIFY))

	GUISetState(@SW_SHOW)

	_MemoWrite("$idBtn Handle: " & $hBtn)
	_MemoWrite("$idRdo Handle: " & $hRdo)
	_MemoWrite("$idChk Handle: " & $hChk & @CRLF)

	MsgBox($MB_SYSTEMMODAL, "Information", "Darüber, wie Buttons zerstört werden")

	Send("^{END}")

	_MemoWrite("Zerstört $idBtn: " & _GUICtrlButton_Destroy($hBtn))
	_MemoWrite("Zerstört $idRdo: " & _GUICtrlButton_Destroy($hRdo))
	_MemoWrite("Zerstört $idChk: " & _GUICtrlButton_Destroy($hChk) & @CRLF)

	_MemoWrite("$idBtn Handle: " & $hBtn)
	_MemoWrite("$idRdo Handle: " & $hRdo)
	_MemoWrite("$idChk Handle: " & $hChk & @CRLF)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example