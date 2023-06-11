#include <GUIConstantsEx.au3>
#include <GuiScrollBars.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGuiMsg, $hGui, $aRect

	$hGui = GUICreate("ScrollBar: Beispiel", 400, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 380, 360, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing($g_idMemo, $GUI_DOCKALL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetBkColor(0x88AABB)

	GUISetState(@SW_SHOW)

	_GUIScrollBars_Init($hGui)

	$aRect = _GUIScrollBars_GetScrollBarRect($hGui, $OBJID_HSCROLL)
	MemoWrite("Horizontal" & @CRLF & "--------------------------------------")
	MemoWrite("Links.........: " & $aRect[0])
	MemoWrite("Oben..........: " & $aRect[1])
	MemoWrite("Rechts........: " & $aRect[2])
	MemoWrite("Unten.......: " & $aRect[3])

	$aRect = _GUIScrollBars_GetScrollBarRect($hGui, $OBJID_VSCROLL)
	MemoWrite(@CRLF & "--------------------------------------" & @CRLF & "Vertikal" & @CRLF & "--------------------------------------")
	MemoWrite("Links........: " & $aRect[0])
	MemoWrite("Oben.........: " & $aRect[1])
	MemoWrite("Rechts.......: " & $aRect[2])
	MemoWrite("Unten......: " & $aRect[3])


	While 1
		$hGuiMsg = GUIGetMsg()

		Switch $hGuiMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
