#include <GUIConstantsEx.au3>
#include <GuiScrollBars.au3>
#include <StructureConstants.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGuiMsg, $hGui

	$hGui = GUICreate("ScrollBar: Beispiel", 400, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 380, 380, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing($g_idMemo, $GUI_DOCKALL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetBkColor(0x88AABB)

	GUISetState(@SW_SHOW)

	_GUIScrollBars_Init($hGui)

	MemoWrite("Horizontal" & @CRLF & "--------------------------------------")
	MemoWrite("nPage....: " & _GUIScrollBars_GetScrollInfoPage($hGui, $SB_HORZ))
	MemoWrite("nPos.....: " & _GUIScrollBars_GetScrollInfoPos($hGui, $SB_HORZ))
	MemoWrite("nMin.....: " & _GUIScrollBars_GetScrollInfoMin($hGui, $SB_HORZ))
	MemoWrite("nMax.....: " & _GUIScrollBars_GetScrollInfoMax($hGui, $SB_HORZ))
	MemoWrite("nTrackPos: " & _GUIScrollBars_GetScrollInfoTrackPos($hGui, $SB_HORZ))

	MemoWrite(@CRLF & "Vertikal" & @CRLF & "--------------------------------------")
	MemoWrite("nPage....: " & _GUIScrollBars_GetScrollInfoPage($hGui, $SB_VERT))
	MemoWrite("nPos.....: " & _GUIScrollBars_GetScrollInfoPos($hGui, $SB_VERT))
	MemoWrite("nMin.....: " & _GUIScrollBars_GetScrollInfoMin($hGui, $SB_VERT))
	MemoWrite("nMax.....: " & _GUIScrollBars_GetScrollInfoMax($hGui, $SB_VERT))
	MemoWrite("nTrackPos: " & _GUIScrollBars_GetScrollInfoTrackPos($hGui, $SB_VERT))

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
