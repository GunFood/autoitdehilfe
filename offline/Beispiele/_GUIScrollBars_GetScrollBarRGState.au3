#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiScrollBars.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGuiMsg, $hGui, $aRGState

	$hGui = GUICreate("ScrollBar: Beispiel", 400, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	_MemoCreate(2, 2, 380, 360, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing($_g_idLst_Memo, $GUI_DOCKALL)
	GUICtrlSetFont($_g_idLst_Memo, 9, 400, 0, "Courier New")
	GUISetBkColor(0x88AABB)

	GUISetState(@SW_SHOW)

	_GUIScrollBars_Init($hGui)

	$aRGState = _GUIScrollBars_GetScrollBarRGState($hGui, $OBJID_HSCROLL)
	_MemoWrite("Horizontal (vorher)" & @CRLF & "--------------------------------------")
	For $x = 0 To 5
		_MemoWrite("rgstate[" & $x & "]...: " & $aRGState[$x])
	Next

	_MemoWrite(@CRLF & "Deaktiviert beide Pfeile: " & _GUIScrollBars_EnableScrollBar($hGui, $SB_HORZ, $ESB_DISABLE_BOTH) & @CRLF)

	$aRGState = _GUIScrollBars_GetScrollBarRGState($hGui, $OBJID_HSCROLL)
	_MemoWrite("Horizontal (nachher)" & @CRLF & "--------------------------------------")
	For $x = 0 To 5
		_MemoWrite("rgstate[" & $x & "]...: " & $aRGState[$x])
	Next

	While 1
		$hGuiMsg = GUIGetMsg()

		Switch $hGuiMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example