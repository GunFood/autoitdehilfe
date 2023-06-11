#include <GUIConstantsEx.au3>
#include <GuiScrollBars.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGuiMsg, $hGui, $aRGState

	$hGui = GUICreate("ScrollBar: Beispiel", 400, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 380, 360, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing($g_idMemo, $GUI_DOCKALL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetBkColor(0x88AABB)

	GUISetState(@SW_SHOW)

	_GUIScrollBars_Init($hGui)

	$aRGState = _GUIScrollBars_GetScrollBarRGState($hGui, $OBJID_HSCROLL)
	MemoWrite("Horizontal (vorher)" & @CRLF & "--------------------------------------")
	For $x = 0 To 5
		MemoWrite("rgstate[" & $x & "]...: " & $aRGState[$x])
	Next

	MemoWrite(@CRLF & "Deaktiviert beide Pfeile: " & _GUIScrollBars_EnableScrollBar($hGui, $SB_HORZ, $ESB_DISABLE_BOTH) & @CRLF)

	$aRGState = _GUIScrollBars_GetScrollBarRGState($hGui, $OBJID_HSCROLL)
	MemoWrite("Horizontal (nachher)" & @CRLF & "--------------------------------------")
	For $x = 0 To 5
		MemoWrite("rgstate[" & $x & "]...: " & $aRGState[$x])
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

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
