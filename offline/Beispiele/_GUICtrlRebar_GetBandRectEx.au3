#include "Extras\HelpFileInternals.au3"

#include <AutoItConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiReBar.au3>
#include <GuiToolbar.au3>
#include <WinAPIConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGui, $idBtn_Exit, $hReBar, $hToolbar, $idInput, $tBorders
	Local Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $e_idHelp

	$hGui = GUICreate("Rebar", 400, 500, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_MAXIMIZEBOX))

	; Erstellt ein Rebar-Control
	$hReBar = _GUICtrlRebar_Create($hGui, BitOR($CCS_TOP, $WS_BORDER, $RBS_VARHEIGHT, $RBS_AUTOSIZE, $RBS_BANDBORDERS))

	_MemoCreate(2, 100, 396, 250, $WS_VSCROLL)

	; Erstellt eine Toolbar in der Rebar
	$hToolbar = _GUICtrlToolbar_Create($hGui, BitOR($TBSTYLE_FLAT, $CCS_NORESIZE, $CCS_NOPARENTALIGN))

	; Fügt die Standard Systembitmaps hinzu
	Switch _GUICtrlToolbar_GetBitmapFlags($hToolbar)
		Case 0
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_SMALL_COLOR)
		Case 2
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)
	EndSwitch

	; Fügt die Buttons hinzu
	_GUICtrlToolbar_AddButton($hToolbar, $e_idNew, $STD_FILENEW)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idOpen, $STD_FILEOPEN)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idSave, $STD_FILESAVE)
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idHelp, $STD_HELP)

	; Erstellt eine Inputbox in der Rebar
	$idInput = GUICtrlCreateInput("Input-Control", 0, 0, 120, 20)

	; Fügt eine Gruppe mit dem Control hinzu
	_GUICtrlRebar_AddBand($hReBar, GUICtrlGetHandle($idInput), 120, 200, "Name:")

	; Fügt eine Gruppe mit dem Control am Anfang der Rebar hinzu
	_GUICtrlRebar_AddToolBarBand($hReBar, $hToolbar, "", 0)

	_GUICtrlRebar_SetBandBackColor($hReBar, 1, Int(0x00008B))
	_GUICtrlRebar_SetBandForeColor($hReBar, 1, Int(0xFFFFFF))

	For $x = 0 To _GUICtrlRebar_GetBandCount($hReBar) - 1
		$tBorders = _GUICtrlRebar_GetBandBordersEx($hReBar, $x)
		_MemoWrite("******** Gruppenindex " & $x & " ********")
		_MemoWrite("====== Ränder der Gruppe =======")
		_MemoWrite("Links..: " & DllStructGetData($tBorders, "Left"))
		_MemoWrite("Oben...: " & DllStructGetData($tBorders, "Top"))
		_MemoWrite("Rechts.: " & DllStructGetData($tBorders, "Right"))
		_MemoWrite("Unten..: " & DllStructGetData($tBorders, "Bottom"))
		$tBorders = _GUICtrlRebar_GetBandRectEx($hReBar, $x)
		_MemoWrite("====== Rechteck der Gruppe =====")
		_MemoWrite("Links..: " & DllStructGetData($tBorders, "Left"))
		_MemoWrite("Oben...: " & DllStructGetData($tBorders, "Top"))
		_MemoWrite("Rechts.: " & DllStructGetData($tBorders, "Right"))
		_MemoWrite("Unten..: " & DllStructGetData($tBorders, "Bottom"))
		_MemoWrite("================================" & @CRLF)
	Next

	$idBtn_Exit = GUICtrlCreateButton("Beenden", 150, 460, 100, 25)
	GUICtrlSetState($idBtn_Exit, $GUI_DEFBUTTON)
	GUICtrlSetState($idBtn_Exit, $GUI_FOCUS)

	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idBtn_Exit
				Exit
		EndSwitch
	WEnd
EndFunc   ;==>Example
