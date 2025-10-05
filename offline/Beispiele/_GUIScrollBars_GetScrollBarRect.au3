#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiScrollBars.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGuiMsg, $hGui, $aRect

	$hGui = GUICreate("ScrollBar: Beispiel", 400, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	_MemoCreate(2, 2, 380, 360, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing($_g_idLst_Memo, $GUI_DOCKALL)
	GUICtrlSetFont($_g_idLst_Memo, 9, 400, 0, "Courier New")
	GUISetBkColor(0x88AABB)

	GUISetState(@SW_SHOW)

	_GUIScrollBars_Init($hGui)

	$aRect = _GUIScrollBars_GetScrollBarRect($hGui, $OBJID_HSCROLL)
	_MemoWrite("Horizontal" & @CRLF & "--------------------------------------")
	_MemoWrite("Links.........: " & $aRect[0])
	_MemoWrite("Oben..........: " & $aRect[1])
	_MemoWrite("Rechts........: " & $aRect[2])
	_MemoWrite("Unten.......: " & $aRect[3])

	$aRect = _GUIScrollBars_GetScrollBarRect($hGui, $OBJID_VSCROLL)
	_MemoWrite(@CRLF & "--------------------------------------" & @CRLF & "Vertikal" & @CRLF & "--------------------------------------")
	_MemoWrite("Links........: " & $aRect[0])
	_MemoWrite("Oben.........: " & $aRect[1])
	_MemoWrite("Rechts.......: " & $aRect[2])
	_MemoWrite("Unten......: " & $aRect[3])


	While 1
		$hGuiMsg = GUIGetMsg()

		Switch $hGuiMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example