#include "Extras\HelpFileInternals.au3"

#include <AutoItConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiReBar.au3>
#include <GuiToolbar.au3>
#include <WinAPIConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGui = GUICreate("Rebar: Ermittelt, welches Item an der festgelegten Position liegt (v" & @AutoItVersion & ")", 600, 396, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_MAXIMIZEBOX))

	; Erstellt ein Rebar-Control
	Local $hReBar = _GUICtrlRebar_Create($hGui, BitOR($CCS_TOP, $WS_BORDER, $RBS_VARHEIGHT, $RBS_AUTOSIZE, $RBS_BANDBORDERS))

	_MemoCreate(2, 30, 396, 320, $WS_VSCROLL)

	; Erstellt eine Toolbar in der Rebar
	Local $hToolbar = _GUICtrlToolbar_Create($hGui, BitOR($TBSTYLE_FLAT, $CCS_NORESIZE, $CCS_NOPARENTALIGN))

	; Fügt die Standard Systembitmaps hinzu
	Switch _GUICtrlToolbar_GetBitmapFlags($hToolbar)
		Case 0
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_SMALL_COLOR)
		Case 2
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)
	EndSwitch

	; Fügt die Buttons hinzu
	Local Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $e_idHelp
	_GUICtrlToolbar_AddButton($hToolbar, $e_idNew, $STD_FILENEW)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idOpen, $STD_FILEOPEN)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idSave, $STD_FILESAVE)
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idHelp, $STD_HELP)

	; Erstellt eine Inputbox in der Rebar
	Local $idInput = GUICtrlCreateInput("Input-Control", 0, 0, 120, 20)

	; Fügt eine Gruppe mit dem Control hinzu
	_GUICtrlRebar_AddBand($hReBar, GUICtrlGetHandle($idInput), 120, 200, "Name:")

	; Fügt eine Gruppe mit dem Control am Anfang der Rebar hinzu
	_GUICtrlRebar_AddToolBarBand($hReBar, $hToolbar, "", 0)

	Local $idBtn_Exit = GUICtrlCreateButton("Beenden", 150, 360, 100, 25)
	GUICtrlSetState($idBtn_Exit, $GUI_DEFBUTTON)
	GUICtrlSetState($idBtn_Exit, $GUI_FOCUS)

	GUISetState(@SW_SHOW)

	Local $aHitTest = _GUICtrlRebar_HitTest($hReBar, 150, 25)
	_MemoWrite("iBand........: " & $aHitTest[0])
	_MemoWrite("$RBHT_NOWHERE: " & $aHitTest[5])
	_MemoWrite("$RBHT_CLIENT.: " & $aHitTest[3])
	_MemoWrite("$RBHT_CAPTION: " & $aHitTest[1])
	_MemoWrite("$RBHT_CHEVRON: " & $aHitTest[2])
	_MemoWrite("$RBHT_GRABBER: " & $aHitTest[4])

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idBtn_Exit
				Exit
		EndSwitch
	WEnd
EndFunc   ;==>Example
