#include "Extras\HelpFileInternals.au3"

#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $y = 70, $a_idBtn[6], $aMargins

	GUICreate("Buttons", 510, 400)
	_MemoCreate(119, 10, 276, 374, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	$a_idBtn[0] = GUICtrlCreateButton("Button 1", 10, 10, 90, 50)
	_GUICtrlButton_SetTextMargin($a_idBtn[0], 10, 5, 10, 5)

	For $x = 1 To 5
		$a_idBtn[$x] = GUICtrlCreateButton("Button" & $x + 1, 10, $y, 90, 50)
		$y += 60
	Next

	For $x = 0 To 5
		$aMargins = _GUICtrlButton_GetTextMargin($a_idBtn[$x])
		_MemoWrite("Button " & $x + 1 & " Ränder:" & @CRLF & @TAB & _
				"Links.: " & $aMargins[0] & @TAB & "Oben..: " & $aMargins[1] & @CRLF & @TAB & _
				"Rechts: " & $aMargins[2] & @TAB & "Unten.: " & $aMargins[3] & @CRLF)
	Next

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example