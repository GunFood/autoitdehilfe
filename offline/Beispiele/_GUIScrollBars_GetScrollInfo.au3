#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiScrollBars.au3>
#include <StructureConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ScrollBars: Setzt und ermittelt die Parameter der Scrollbar (v" & @AutoItVersion & ")", 600, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	_MemoCreate(2, 2, 380, 360, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing($_g_idLst_Memo, $GUI_DOCKALL)
	GUICtrlSetFont($_g_idLst_Memo, 9, 400, 0, "Courier New")
	GUISetBkColor(0x88AABB)

	GUISetState(@SW_SHOW)

	_GUIScrollBars_Init($hGUI)

	Local $tSCROLLINFO = DllStructCreate($tagSCROLLINFO)
	DllStructSetData($tSCROLLINFO, "cbSize", DllStructGetSize($tSCROLLINFO))
	DllStructSetData($tSCROLLINFO, "fMask", $SIF_ALL)
	_GUIScrollBars_GetScrollInfo($hGUI, $SB_HORZ, $tSCROLLINFO)
	_MemoWrite("Horizontal" & @CRLF & "--------------------------------------")
	_MemoWrite("nPage....: " & DllStructGetData($tSCROLLINFO, "nPage"))
	_MemoWrite("nPos.....: " & DllStructGetData($tSCROLLINFO, "nPos"))
	_MemoWrite("nMin.....: " & DllStructGetData($tSCROLLINFO, "nMin"))
	_MemoWrite("nMax.....: " & DllStructGetData($tSCROLLINFO, "nMax"))
	_MemoWrite("nTrackPos: " & DllStructGetData($tSCROLLINFO, "nTrackPos"))

	DllStructSetData($tSCROLLINFO, "cbSize", DllStructGetSize($tSCROLLINFO))
	DllStructSetData($tSCROLLINFO, "fMask", $SIF_ALL)
	_GUIScrollBars_GetScrollInfo($hGUI, $SB_VERT, $tSCROLLINFO)
	_MemoWrite(@CRLF & "Vertikal" & @CRLF & "--------------------------------------")
	_MemoWrite("nPage....: " & DllStructGetData($tSCROLLINFO, "nPage"))
	_MemoWrite("nPos.....: " & DllStructGetData($tSCROLLINFO, "nPos"))
	_MemoWrite("nMin.....: " & DllStructGetData($tSCROLLINFO, "nMin"))
	_MemoWrite("nMax.....: " & DllStructGetData($tSCROLLINFO, "nMax"))
	_MemoWrite("nTrackPos: " & DllStructGetData($tSCROLLINFO, "nTrackPos"))

	; Stellt den Bereich des vertikalen Bildlaufs und der Seitengröße ein
	DllStructSetData($tSCROLLINFO, "fMask", $SIF_RANGE)
	DllStructSetData($tSCROLLINFO, "nMin", 5)
	DllStructSetData($tSCROLLINFO, "nMax", 80)
	_GUIScrollBars_SetScrollInfo($hGUI, $SB_VERT, $tSCROLLINFO)

	; Stellt den Bereich des horizontalen Bildlaufs und der Seitengröße ein
	DllStructSetData($tSCROLLINFO, "fMask", $SIF_RANGE)
	DllStructSetData($tSCROLLINFO, "nMin", 10)
	DllStructSetData($tSCROLLINFO, "nMax", 120)
	_GUIScrollBars_SetScrollInfo($hGUI, $SB_HORZ, $tSCROLLINFO)

	DllStructSetData($tSCROLLINFO, "cbSize", DllStructGetSize($tSCROLLINFO))
	DllStructSetData($tSCROLLINFO, "fMask", $SIF_ALL)
	_GUIScrollBars_GetScrollInfo($hGUI, $SB_HORZ, $tSCROLLINFO)
	_MemoWrite(@CRLF & "Horizontal geändert" & @CRLF & "--------------------------------------")
	_MemoWrite("nMin.....: " & DllStructGetData($tSCROLLINFO, "nMin"))
	_MemoWrite("nMax.....: " & DllStructGetData($tSCROLLINFO, "nMax"))

	DllStructSetData($tSCROLLINFO, "cbSize", DllStructGetSize($tSCROLLINFO))
	DllStructSetData($tSCROLLINFO, "fMask", $SIF_ALL)
	_GUIScrollBars_GetScrollInfo($hGUI, $SB_VERT, $tSCROLLINFO)
	_MemoWrite(@CRLF & "Vertikal geändert" & @CRLF & "--------------------------------------")
	_MemoWrite("nMin.....: " & DllStructGetData($tSCROLLINFO, "nMin"))
	_MemoWrite("nMax.....: " & DllStructGetData($tSCROLLINFO, "nMax"))

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example
