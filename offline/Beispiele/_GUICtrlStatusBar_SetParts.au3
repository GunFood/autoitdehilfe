; == Example 1 : with default Widths

#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>

Example()

Func Example()
	; Create GUI
	Local $hGUI = GUICreate("StatusBar Set Parts (v" & @AutoItVersion & ")", 450, 320, 100, 100)
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Create memo control
	_MemoCreate(2, 8, 444, 259)
	GUISetState(@SW_SHOW)

	; Set/Get parts
	Local $aParts[3] = [75, 150, -1]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	;Set Text/ Get Width
	Local $iParts = _GUICtrlStatusBar_GetCount($hStatus)
	For $iI = 0 To $iParts - 1
		_GUICtrlStatusBar_SetText($hStatus, "Text " & $iI, $iI)
		_MemoWrite("Part " & $iI & " width .: " & _GUICtrlStatusBar_GetWidth($hStatus, $iI))
	Next

	_MemoMsgBoxStatus("", -1, $hGUI) ; no more action, wait GUI for closing

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
