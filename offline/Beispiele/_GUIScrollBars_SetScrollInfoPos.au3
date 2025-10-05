#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiScrollBars.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGuiMsg, $hGui

	$hGui = GUICreate("ScrollBar: Beispiel", 400, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	_MemoCreate(2, 2, 380, 380, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing($_g_idLst_Memo, $GUI_DOCKALL)
	GUICtrlSetFont($_g_idLst_Memo, 9, 400, 0, "Courier New")
	GUISetBkColor(0x88AABB)

	GUISetState(@SW_SHOW)

	_GUIScrollBars_Init($hGui)

	_GUIScrollBars_SetScrollInfoPos($hGui, $SB_HORZ, 30)

	_MemoWrite("Horizontal" & @CRLF & "--------------------------------------")
	_MemoWrite("nPage....: " & _GUIScrollBars_GetScrollInfoPage($hGui, $SB_HORZ))
	_MemoWrite("nPos.....: " & _GUIScrollBars_GetScrollInfoPos($hGui, $SB_HORZ))
	_MemoWrite("nMin.....: " & _GUIScrollBars_GetScrollInfoMin($hGui, $SB_HORZ))
	_MemoWrite("nMax.....: " & _GUIScrollBars_GetScrollInfoMax($hGui, $SB_HORZ))
	_MemoWrite("nTrackPos: " & _GUIScrollBars_GetScrollInfoTrackPos($hGui, $SB_HORZ))

	Sleep(3000)

	_MemoWrite(@CRLF & "Vertikal" & @CRLF & "--------------------------------------")
	_MemoWrite("nPage....: " & _GUIScrollBars_GetScrollInfoPage($hGui, $SB_VERT))
	_MemoWrite("nPos.....: " & _GUIScrollBars_GetScrollInfoPos($hGui, $SB_VERT))
	_MemoWrite("nMin.....: " & _GUIScrollBars_GetScrollInfoMin($hGui, $SB_VERT))
	_MemoWrite("nMax.....: " & _GUIScrollBars_GetScrollInfoMax($hGui, $SB_VERT))
	_MemoWrite("nTrackPos: " & _GUIScrollBars_GetScrollInfoTrackPos($hGui, $SB_VERT))

	_GUIScrollBars_SetScrollInfoPos($hGui, $SB_HORZ, 0)

	While 1
		$hGuiMsg = GUIGetMsg()

		Switch $hGuiMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example