#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiScrollBars.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ScrollBars Setzt und ermittelt die Scroll InfoPage (v" & @AutoItVersion & ")", 500, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	_MemoCreate(2, 2, 380, 380, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing($_g_idLst_Memo, $GUI_DOCKALL)
	GUICtrlSetFont($_g_idLst_Memo, 9, 400, 0, "Courier New")
	GUISetBkColor(0x88AABB)

	GUISetState(@SW_SHOW)

	_GUIScrollBars_Init($hGUI)

	_GUIScrollBars_SetScrollInfoMin($hGUI, $SB_HORZ, 10)
	_GUIScrollBars_SetScrollInfoMax($hGUI, $SB_HORZ, 80)
	_GUIScrollBars_SetScrollInfoPage($hGUI, $SB_HORZ, 60)

	_MemoWrite("Horizontal" & @CRLF & "--------------------------------------")
	_MemoWrite("nPage....: " & _GUIScrollBars_GetScrollInfoPage($hGUI, $SB_HORZ))
	_MemoWrite("nPos.....: " & _GUIScrollBars_GetScrollInfoPos($hGUI, $SB_HORZ))
	_MemoWrite("nMin.....: " & _GUIScrollBars_GetScrollInfoMin($hGUI, $SB_HORZ))
	_MemoWrite("nMax.....: " & _GUIScrollBars_GetScrollInfoMax($hGUI, $SB_HORZ))
	_MemoWrite("nTrackPos: " & _GUIScrollBars_GetScrollInfoTrackPos($hGUI, $SB_HORZ))

	_MemoWrite(@CRLF & "Vertikal" & @CRLF & "--------------------------------------")
	_MemoWrite("nPage....: " & _GUIScrollBars_GetScrollInfoPage($hGUI, $SB_VERT))
	_MemoWrite("nPos.....: " & _GUIScrollBars_GetScrollInfoPos($hGUI, $SB_VERT))
	_MemoWrite("nMin.....: " & _GUIScrollBars_GetScrollInfoMin($hGUI, $SB_VERT))
	_MemoWrite("nMax.....: " & _GUIScrollBars_GetScrollInfoMax($hGUI, $SB_VERT))
	_MemoWrite("nTrackPos: " & _GUIScrollBars_GetScrollInfoTrackPos($hGUI, $SB_VERT))

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example