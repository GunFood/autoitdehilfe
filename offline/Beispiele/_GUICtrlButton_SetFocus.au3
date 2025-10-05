#include "Extras\HelpFileInternals.au3"

#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $idRdo, $idRdo2, $idChk

	GUICreate("Buttons", 400, 400)
	_MemoCreate(119, 10, 276, 374, $WS_VSCROLL)

	$idRdo = GUICtrlCreateRadio("Radio1", 10, 10, 90, 50)
	_GUICtrlButton_SetFocus($idRdo)

	$idRdo2 = GUICtrlCreateRadio("Radio2", 10, 60, 90, 50)
	_GUICtrlButton_SetCheck($idRdo2)

	$idChk = GUICtrlCreateCheckbox("Check1", 10, 120, 90, 50, BitOR($BS_AUTO3STATE, $BS_NOTIFY))
	_GUICtrlButton_SetCheck($idChk, $BST_INDETERMINATE)

	GUISetState(@SW_SHOW)

	_MemoWrite(StringFormat("$idRdo Fokus Status.: %s", _GUICtrlButton_GetFocus($idRdo)))
	_MemoWrite(StringFormat("$idRdo2 Fokus Status: %s", _GUICtrlButton_GetFocus($idRdo2)))
	_MemoWrite(StringFormat("$idChk Fokus Status.: %s", _GUICtrlButton_GetFocus($idChk)))

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example