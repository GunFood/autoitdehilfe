#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiToolbar.au3>
#include <WinAPIConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Ermittelt die Einfügemarken-Informationen für einen Punkt (v" & @AutoItVersion & ")", 600, 300)
	Local $hToolbar = _GUICtrlToolbar_Create($hGUI)
	_MemoCreate(2, 36, 396, 262, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Fügt die Standard Systembitmaps hinzu
	Switch _GUICtrlToolbar_GetBitmapFlags($hToolbar)
		Case 0
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_SMALL_COLOR)
		Case 2
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)
	EndSwitch

	; Fügt Strings hinzu
	Local $aStrings[4]
	$aStrings[0] = _GUICtrlToolbar_AddString($hToolbar, "&Neu Button")
	$aStrings[1] = _GUICtrlToolbar_AddString($hToolbar, "&Öffnen Button")
	$aStrings[2] = _GUICtrlToolbar_AddString($hToolbar, "&Speichern Button")
	$aStrings[3] = _GUICtrlToolbar_AddString($hToolbar, "&Hilfe Button")

	; Fügt die Buttons hinzu
	Local Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $e_idHelp
	_GUICtrlToolbar_AddButton($hToolbar, $e_idNew, $STD_FILENEW, $aStrings[0])
	_GUICtrlToolbar_AddButton($hToolbar, $e_idOpen, $STD_FILEOPEN, $aStrings[1])
	_GUICtrlToolbar_AddButton($hToolbar, $e_idSave, $STD_FILESAVE, $aStrings[2])
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idHelp, $STD_HELP, $aStrings[3])

	; Setzt die Einfügemarke
	_GUICtrlToolbar_SetInsertMark($hToolbar, 1, 1)

	; Ermittelt die Einfügemarken-Informationen für Punkt 1
	Local $aMark = _GUICtrlToolbar_InsertMarkHitTest($hToolbar, 0, 0)
	_MemoWrite("Index .............................: " & $aMark[0])
	_MemoWrite("Position im Verhältnis zum Button .: " & $aMark[1])

	; Ermittelt die Einfügemarken-Informationen für Punkt 2
	Local $aRect = _GUICtrlToolbar_GetButtonRect($hToolbar, $e_idSave)
	$aMark = _GUICtrlToolbar_InsertMarkHitTest($hToolbar, $aRect[0], $aRect[1])
	_MemoWrite("Index .............................: " & $aMark[0])
	_MemoWrite("Position im Verhältnis zum Button .: " & $aMark[1])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example