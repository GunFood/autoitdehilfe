#Region ;************ Includes ************
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GUIScrollBars.au3>
#EndRegion ;************ Includes ************

Opt("MustDeclareVars", 1)

Global $iMemo

_Main()

Func _Main()
	Local $GUIMsg, $hGUI

	$hGUI = GUICreate("ScrollBar: Beispiel", 200, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 226, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing($iMemo, $GUI_DOCKALL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetBkColor(0x88AABB)

	GUISetState()

	_GUIScrollBars_Init($hGUI)

	Sleep(2000)
	MemoWrite("Deaktiviert den 'nach unten'-Pfeil: " & _GUIScrollBars_EnableScrollBar($hGUI, $SB_VERT, $ESB_DISABLE_DOWN))
	Sleep(3000)
	MemoWrite("Deaktiviert den 'nach oben'-Pfeil: " & _GUIScrollBars_EnableScrollBar($hGUI, $SB_VERT, $ESB_DISABLE_UP))
	Sleep(3000)
	MemoWrite("Aktiviert beide Pfeile: " & _GUIScrollBars_EnableScrollBar($hGUI, $SB_VERT, $ESB_ENABLE_BOTH))
	Sleep(3000)
	MemoWrite("Deaktiviert den 'nach links'-Pfeil: " & _GUIScrollBars_EnableScrollBar($hGUI, $SB_HORZ, $ESB_DISABLE_LEFT))
	Sleep(3000)
	MemoWrite("Deaktiviert den 'nach rechts'-Pfeil: " & _GUIScrollBars_EnableScrollBar($hGUI, $SB_HORZ, $ESB_DISABLE_RIGHT))
	Sleep(3000)
	MemoWrite("Aktiviert beide Pfeile: " & _GUIScrollBars_EnableScrollBar($hGUI, $SB_HORZ, $ESB_ENABLE_BOTH))

	While 1
		$GUIMsg = GUIGetMsg()

		Switch $GUIMsg
			Case $GUI_EVENT_CLOSE ;, $nExititem
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>_Main

; Schreibt eine Zeile in das Memo Steuerelement
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
