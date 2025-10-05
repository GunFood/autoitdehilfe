#include "Extras\HelpFileInternals.au3"

#include <AutoItConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiToolbar.au3>
#include <WinAPIConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $e_idHelp

	; Erstellt eine GUI
	Local $hGUI = GUICreate("Toolbar: setzt und ermittelt die Anzahl von Zeilen von Buttons (v" & @AutoItVersion & ")", 600, 300)
	Local $hToolbar = _GUICtrlToolbar_Create($hGUI)
	_MemoCreate(36, 2, 396, 262, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlToolbar_SetUnicodeFormat($hToolbar, False)

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

	; Erstellt eine vertikale Toolbar
	_GUICtrlToolbar_SetStyle($hToolbar, BitOR($CCS_LEFT, $TBSTYLE_FLAT))
	_GUICtrlToolbar_SetRows($hToolbar, 4)

	; Zeigt die Anzahl der Zeilen
	_MemoWrite("Anzahl der Zeilen:" & _GUICtrlToolbar_GetRows($hToolbar))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example