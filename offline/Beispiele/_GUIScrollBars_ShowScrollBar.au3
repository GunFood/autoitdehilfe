#include <GUIConstantsEx.au3>
#include <GuiScrollBars.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGuiMsg, $hGui

	$hGui = GUICreate("ScrollBar: Beispiel", 400, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	GUISetBkColor(0x88AABB)

	GUISetState(@SW_SHOW)

	_GUIScrollBars_Init($hGui)

	; Vertikale Scrollbar verstecken
	_GUIScrollBars_ShowScrollBar($hGui, $SB_HORZ, False)
	Sleep(1000)
	; Vertikale Scrollbar anzeigen
	_GUIScrollBars_ShowScrollBar($hGui, $SB_HORZ)
	Sleep(1000)
	; Horizontale Scrollbar verstecken
	_GUIScrollBars_ShowScrollBar($hGui, $SB_VERT, False)
	Sleep(1000)
	; Horizontale Scrollbar anzeigen
	_GUIScrollBars_ShowScrollBar($hGui, $SB_VERT)

	While 1
		$hGuiMsg = GUIGetMsg()

		Switch $hGuiMsg
			Case $GUI_EVENT_CLOSE;, $nExititem
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example
