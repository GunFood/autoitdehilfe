#include "Extras\HelpFileInternals.au3"

#include <AutoItConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiReBar.au3>
#include <GuiToolbar.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGui = GUICreate("Rebar: Setzt, dass die Gruppe in der Größe nicht verändert werden kann bzw. ermittelt dies (v" & @AutoItVersion & ")", 720, 396, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_MAXIMIZEBOX))

	; Erstellt ein Rebar-Control
	Local $hReBar = _GUICtrlRebar_Create($hGui, BitOR($CCS_TOP, $WS_BORDER, $RBS_VARHEIGHT, $RBS_AUTOSIZE, $RBS_BANDBORDERS))

	_MemoCreate(2, 100, 416, 250, $WS_VSCROLL)

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

	MsgBox($MB_SYSTEMMODAL, "Information", "Setzt den Stil: Fixierte Größe")
	_GUICtrlRebar_SetBandStyleFixedSize($hReBar, 1)

	For $x = 0 To _GUICtrlRebar_GetBandCount($hReBar) - 1
		_MemoWrite("Gruppenindex " & $x & @TAB & "$RBBS_FIXEDSIZE.....: " & _GUICtrlRebar_GetBandStyleFixedSize($hReBar, $x))
		_MemoWrite("============================================")
	Next

	MsgBox($MB_SYSTEMMODAL, "Information", "Setzt den Stil: Fixierte Größe")
	_GUICtrlRebar_SetBandStyleFixedSize($hReBar, 1, False)

	For $x = 0 To _GUICtrlRebar_GetBandCount($hReBar) - 1
		_MemoWrite("Gruppenindex " & $x & @TAB & "$RBBS_FIXEDSIZE.....: " & _GUICtrlRebar_GetBandStyleFixedSize($hReBar, $x))
		_MemoWrite("============================================")
	Next

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idBtn_Exit
				Exit
		EndSwitch
	WEnd
EndFunc   ;==>Example
