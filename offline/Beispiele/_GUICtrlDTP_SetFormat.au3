#include <GuiConstantsEx.au3>
#include <GuiDateTimePicker.au3>

Example()

Func Example()
	Local $hDTP

	; Erstellt eine GUI
	GUICreate("DateTimePick: Setzt das Format (v" & @AutoItVersion & ")", 400, 300)
	$hDTP = GUICtrlGetHandle(GUICtrlCreateDate("", 2, 6, 190))

	GUISetState(@SW_SHOW)

	; Setzt das Anzeigeformat
	Local $iRet = _GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $iRet = ' & $iRet & @CRLF & '>Error code: ' & @error & '    Extended code: ' & @extended & ' (0x' & Hex(@extended) & ')' & @CRLF) ;### Debug Console

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
