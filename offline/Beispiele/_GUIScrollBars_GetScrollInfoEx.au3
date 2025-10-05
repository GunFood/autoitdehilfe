#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiScrollBars.au3>
#include <StructureConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGUIMsg, $hGUI, $tSCROLLINFO = DllStructCreate($tagSCROLLINFO)

	$hGUI = GUICreate("ScrollBar: Beispiel", 400, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	_MemoCreate(2, 2, 380, 360, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing($_g_idLst_Memo, $GUI_DOCKALL)
	GUICtrlSetFont($_g_idLst_Memo, 9, 400, 0, "Courier New")
	GUISetBkColor(0x88AABB)

	GUISetState(@SW_SHOW)

	_GUIScrollBars_Init($hGUI)

	$tSCROLLINFO = _GUIScrollBars_GetScrollInfoEx($hGUI, $SB_VERT)
	_MemoWrite("Horizontal" & @CRLF & "--------------------------------------")
	_MemoWrite("nPage....: " & DllStructGetData($tSCROLLINFO, "nPage"))
	_MemoWrite("nPos.....: " & DllStructGetData($tSCROLLINFO, "nPos"))
	_MemoWrite("nMin.....: " & DllStructGetData($tSCROLLINFO, "nMin"))
	_MemoWrite("nMax.....: " & DllStructGetData($tSCROLLINFO, "nMax"))
	_MemoWrite("nTrackPos: " & DllStructGetData($tSCROLLINFO, "nTrackPos"))

	$tSCROLLINFO = _GUIScrollBars_GetScrollInfoEx($hGUI, $SB_VERT)
	_MemoWrite(@CRLF & "Vertikal" & @CRLF & "--------------------------------------")
	_MemoWrite("nPage....: " & DllStructGetData($tSCROLLINFO, "nPage"))
	_MemoWrite("nPos.....: " & DllStructGetData($tSCROLLINFO, "nPos"))
	_MemoWrite("nMin.....: " & DllStructGetData($tSCROLLINFO, "nMin"))
	_MemoWrite("nMax.....: " & DllStructGetData($tSCROLLINFO, "nMax"))
	_MemoWrite("nTrackPos: " & DllStructGetData($tSCROLLINFO, "nTrackPos"))

	While 1
		$hGUIMsg = GUIGetMsg()

		Switch $hGUIMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example