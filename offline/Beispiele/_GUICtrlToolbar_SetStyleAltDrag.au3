#include <GUIConstantsEx.au3>
#include <GuiToolbar.au3>
#include <WinAPIConstants.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGui, $hToolbar, $bStyle
	Local Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $idHelp

	; Erstellt eine GUI
	$hGui = GUICreate("Toolbar", 800, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGui)
	$g_idMemo = GUICtrlCreateEdit("", 2, 36, 796, 262, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 10, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

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
	_GUICtrlToolbar_AddButton($hToolbar, $idHelp, $STD_HELP)

	; Ändert den Stil des Controls
	$bStyle = _GUICtrlToolbar_GetStyleAltDrag($hToolbar)
	MemoWrite("Zeigt an, ob das Control es erlaubt, dass Buttons mitgeschleppt werden können .: " & $bStyle)
	_GUICtrlToolbar_SetStyleAltDrag($hToolbar, Not $bStyle)
	MemoWrite("Zeigt an, ob das Control es erlaubt, dass Buttons mitgeschleppt werden können .: " & _GUICtrlToolbar_GetStyleAltDrag($hToolbar))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
