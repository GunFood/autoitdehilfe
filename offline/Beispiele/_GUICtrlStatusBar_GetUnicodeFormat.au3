#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGui, $hStatus

	; Erstellt eine GUI
	$hGui = GUICreate("StatusBar: Ermittelt das Unicode Format", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGui)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt/Setzt das Unicode Format
	MemoWrite("Unicode Format .: " & _GUICtrlStatusBar_GetUnicodeFormat($hStatus))
	_GUICtrlStatusBar_SetUnicodeFormat($hStatus)
	MemoWrite("Unicode Format .: " & _GUICtrlStatusBar_GetUnicodeFormat($hStatus))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
