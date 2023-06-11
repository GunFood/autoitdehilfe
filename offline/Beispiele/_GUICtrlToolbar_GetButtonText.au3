#include <GUIConstantsEx.au3>
#include <GuiToolbar.au3>
#include <WinAPIConstants.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Toolbar: setzt und ermittelt den Text des Buttons (v" & @AutoItVersion & ")", 500, 300)
	Local $hToolbar = _GUICtrlToolbar_Create($hGUI)
	$g_idMemo = GUICtrlCreateEdit("", 2, 60, 396, 238, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 10, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Fügt die Standard Systembitmaps hinzu
	Switch _GUICtrlToolbar_GetBitmapFlags($hToolbar)
		Case 0
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_SMALL_COLOR)
		Case 2
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)
	EndSwitch

	; F+ügt Strings hinzu
	Local $aStrings[4]
	$aStrings[0] = _GUICtrlToolbar_AddString($hToolbar, "&Neu")
	$aStrings[1] = _GUICtrlToolbar_AddString($hToolbar, "&Öffnen")
	$aStrings[2] = _GUICtrlToolbar_AddString($hToolbar, "&Speichern")
	$aStrings[3] = _GUICtrlToolbar_AddString($hToolbar, "&Hilfe")

	; Fügt die Buttons hinzu
		Local Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $idHelp
	_GUICtrlToolbar_AddButton($hToolbar, $e_idNew, $STD_FILENEW, $aStrings[0])
	_GUICtrlToolbar_AddButton($hToolbar, $e_idOpen, $STD_FILEOPEN, $aStrings[1])
	_GUICtrlToolbar_AddButton($hToolbar, $e_idSave, $STD_FILESAVE, $aStrings[2])
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $idHelp, $STD_HELP, $aStrings[3])

	; Zeigt den Text des Speichern-Buttons
	MemoWrite("Text des Speichern-Buttons: " & _GUICtrlToolbar_GetButtonText($hToolbar, $e_idSave))

	; Ändert den Text des Speichern-Buttons
	_GUICtrlToolbar_SetButtonText($hToolbar, $e_idSave, "&Schließen")

	; Zeigt den Text des Speichern-Buttons
	MemoWrite("Text des Speichern-Buttons: " & _GUICtrlToolbar_GetButtonText($hToolbar, $e_idSave))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
