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

	_GUIScrollBars_SetScrollInfoPos($hGui, $SB_HORZ, 10)
	_MemoWrite("Scrollposition horizontal: " & _GUIScrollBars_GetScrollPos($hGui, $SB_HORZ))
	Sleep(1000)
	_GUIScrollBars_SetScrollInfoPos($hGui, $SB_HORZ, 0)
	_MemoWrite("Scrollposition horizontal: " & _GUIScrollBars_GetScrollPos($hGui, $SB_HORZ))
	Sleep(1000)
	_GUIScrollBars_SetScrollInfoPos($hGui, $SB_VERT, 20)
	_MemoWrite("Scrollposition vertikal: " & _GUIScrollBars_GetScrollPos($hGui, $SB_VERT))
	Sleep(1000)
	_GUIScrollBars_SetScrollInfoPos($hGui, $SB_VERT, 0)
	_MemoWrite("Scrollposition vertikal: " & _GUIScrollBars_GetScrollPos($hGui, $SB_VERT))

	While 1
		$hGuiMsg = GUIGetMsg()

		Switch $hGuiMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example