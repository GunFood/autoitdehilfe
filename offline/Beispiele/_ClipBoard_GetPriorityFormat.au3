#include <Clipboard.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $aFormats[3] = [2, $CF_TEXT, $CF_OEMTEXT]

	; Erstellt eine GUI
	GUICreate("Zwischenablage", 600, 400)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Schau nach, ob irgendein Text in der Zwischenablage ist
	MemoWrite("Bevorzugte Formate .:. " & _ClipBoard_GetPriorityFormat($aFormats))
	MemoWrite("Unicode-Text verfügbar .: " & _ClipBoard_IsFormatAvailable($CF_UNICODETEXT))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
