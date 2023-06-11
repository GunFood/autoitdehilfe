#include <GUIConstantsEx.au3>
#include <GuiToolbar.au3>
#include <WinAPIConstants.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Toolbar: setzt und ermittelt erweiterte Informationen für einen Button (v" & @AutoItVersion & ")", 600, 300)
	Local $hToolbar = _GUICtrlToolbar_Create($hGUI)
	$g_idMemo = GUICtrlCreateEdit("", 2, 36, 396, 262, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 10, 400, 0, "Courier New")
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
	Local Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $idHelp
	_GUICtrlToolbar_AddButton($hToolbar, $e_idNew, $STD_FILENEW)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idOpen, $STD_FILEOPEN)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idSave, $STD_FILESAVE)
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $idHelp, $STD_HELP)

	; Setzt Informationen des 'Speichern-Buttons'
	Local $tButton = DllStructCreate($tagTBBUTTONINFO)
	$tButton = DllStructCreate($tagTBBUTTONINFO)
	DllStructSetData($tButton, "Mask", BitOR($TBIF_IMAGE, $TBIF_STATE, $TBIF_SIZE, $TBIF_LPARAM))
	DllStructSetData($tButton, "State", BitOR($TBSTATE_PRESSED, $TBSTATE_ENABLED))
	DllStructSetData($tButton, "Image", $STD_PRINT)
	DllStructSetData($tButton, "CX", 100)
	DllStructSetData($tButton, "Param", 1234)
	_GUICtrlToolbar_SetButtonInfoEx($hToolbar, $e_idSave, $tButton)

	; Zeigt Informationen des 'Speichern-Buttons'
	$tButton = _GUICtrlToolbar_GetButtonInfoEx($hToolbar, $e_idSave)
	MemoWrite("Bilderindex ....: " & DllStructGetData($tButton, "Image"))
	MemoWrite("Statusflag .....: " & DllStructGetData($tButton, "State"))
	MemoWrite("Buttonbreite ...: " & DllStructGetData($tButton, "CX"))
	MemoWrite("Parameter ......: " & DllStructGetData($tButton, "Param"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
