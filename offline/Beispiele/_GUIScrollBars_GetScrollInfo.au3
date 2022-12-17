#include <GUIConstantsEx.au3>
#include <GuiScrollBars.au3>
#include <StructureConstants.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGUI = GUICreate("ScrollBars: Setzt und ermittelt die Parameter der Scrollbar (v" & @AutoItVersion & ")", 600, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 380, 360, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing($g_idMemo, $GUI_DOCKALL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetBkColor(0x88AABB)

	GUISetState(@SW_SHOW)

	_GUIScrollBars_Init($hGUI)

	Local $tSCROLLINFO = DllStructCreate($tagSCROLLINFO)
	DllStructSetData($tSCROLLINFO, "cbSize", DllStructGetSize($tSCROLLINFO))
	DllStructSetData($tSCROLLINFO, "fMask", $SIF_ALL)
	_GUIScrollBars_GetScrollInfo($hGUI, $SB_HORZ, $tSCROLLINFO)
	MemoWrite("Horizontal" & @CRLF & "--------------------------------------")
	MemoWrite("nPage....: " & DllStructGetData($tSCROLLINFO, "nPage"))
	MemoWrite("nPos.....: " & DllStructGetData($tSCROLLINFO, "nPos"))
	MemoWrite("nMin.....: " & DllStructGetData($tSCROLLINFO, "nMin"))
	MemoWrite("nMax.....: " & DllStructGetData($tSCROLLINFO, "nMax"))
	MemoWrite("nTrackPos: " & DllStructGetData($tSCROLLINFO, "nTrackPos"))

	DllStructSetData($tSCROLLINFO, "cbSize", DllStructGetSize($tSCROLLINFO))
	DllStructSetData($tSCROLLINFO, "fMask", $SIF_ALL)
	_GUIScrollBars_GetScrollInfo($hGUI, $SB_VERT, $tSCROLLINFO)
	MemoWrite(@CRLF & "Vertikal" & @CRLF & "--------------------------------------")
	MemoWrite("nPage....: " & DllStructGetData($tSCROLLINFO, "nPage"))
	MemoWrite("nPos.....: " & DllStructGetData($tSCROLLINFO, "nPos"))
	MemoWrite("nMin.....: " & DllStructGetData($tSCROLLINFO, "nMin"))
	MemoWrite("nMax.....: " & DllStructGetData($tSCROLLINFO, "nMax"))
	MemoWrite("nTrackPos: " & DllStructGetData($tSCROLLINFO, "nTrackPos"))

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
	MemoWrite(@CRLF & "Horizontal geändert" & @CRLF & "--------------------------------------")
	MemoWrite("nMin.....: " & DllStructGetData($tSCROLLINFO, "nMin"))
	MemoWrite("nMax.....: " & DllStructGetData($tSCROLLINFO, "nMax"))

	DllStructSetData($tSCROLLINFO, "cbSize", DllStructGetSize($tSCROLLINFO))
	DllStructSetData($tSCROLLINFO, "fMask", $SIF_ALL)
	_GUIScrollBars_GetScrollInfo($hGUI, $SB_VERT, $tSCROLLINFO)
	MemoWrite(@CRLF & "Vertikal geändert" & @CRLF & "--------------------------------------")
	MemoWrite("nMin.....: " & DllStructGetData($tSCROLLINFO, "nMin"))
	MemoWrite("nMax.....: " & DllStructGetData($tSCROLLINFO, "nMax"))

	While 1
		Switch GUIGetMsg()
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
