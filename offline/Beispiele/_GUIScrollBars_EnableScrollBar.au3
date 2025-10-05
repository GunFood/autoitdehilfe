#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiScrollBars.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGuiMsg, $hGui

	$hGui = GUICreate("ScrollBar: Beispiel", 400, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	_MemoCreate(2, 32, 380, 226, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing($_g_idLst_Memo, $GUI_DOCKALL)
	GUICtrlSetFont($_g_idLst_Memo, 9, 400, 0, "Courier New")
	GUISetBkColor(0x88AABB)

	GUISetState(@SW_SHOW)

	_GUIScrollBars_Init($hGui)

	_MemoWrite("Deaktiviert den 'nach unten'-Pfeil: " & _GUIScrollBars_EnableScrollBar($hGui, $SB_VERT, $ESB_DISABLE_DOWN))
	Sleep(3000)
	_MemoWrite("Deaktiviert den 'nach oben'-Pfeil: " & _GUIScrollBars_EnableScrollBar($hGui, $SB_VERT, $ESB_DISABLE_UP))
	Sleep(3000)
	_MemoWrite("Aktiviert beide Pfeile: " & _GUIScrollBars_EnableScrollBar($hGui, $SB_VERT, $ESB_ENABLE_BOTH))
	Sleep(3000)
	_MemoWrite("Deaktiviert den 'nach links'-Pfeil: " & _GUIScrollBars_EnableScrollBar($hGui, $SB_HORZ, $ESB_DISABLE_LEFT))
	Sleep(3000)
	_MemoWrite("Deaktiviert den 'nach rechts'-Pfeil: " & _GUIScrollBars_EnableScrollBar($hGui, $SB_HORZ, $ESB_DISABLE_RIGHT))
	Sleep(3000)
	_MemoWrite("Aktiviert beide Pfeile: " & _GUIScrollBars_EnableScrollBar($hGui, $SB_HORZ, $ESB_ENABLE_BOTH))

	While 1
		$hGuiMsg = GUIGetMsg()

		Switch $hGuiMsg
			Case $GUI_EVENT_CLOSE;, $nExititem
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example
