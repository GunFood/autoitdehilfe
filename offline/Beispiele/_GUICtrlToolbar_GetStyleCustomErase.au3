#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiToolbar.au3>
#include <WinAPIConstants.au3>
#include <WindowsStylesConstants.au3>
Example()

Func Example()
	Local $hGui, $hToolbar, $bStyle
	Local Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $e_idHelp

	; Erstellt eine GUI
	$hGui = GUICreate("Toolbar", 550, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGui)
	_MemoCreate(2, 36, 396, 262, $WS_VSCROLL)
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
	_GUICtrlToolbar_AddButton($hToolbar, $e_idHelp, $STD_HELP)

	; Ändert den Stil des Controls
	$bStyle = _GUICtrlToolbar_GetStyleCustomErase($hToolbar)
	_MemoWrite("Das Control erzeugt NM_CUSTOMDRAW Nachrichten .: " & $bStyle)
	_GUICtrlToolbar_SetStyleCustomErase($hToolbar, Not $bStyle)
	_MemoWrite("Das Control erzeugt NM_CUSTOMDRAW Nachrichten .: " & _GUICtrlToolbar_GetStyleCustomErase($hToolbar))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example