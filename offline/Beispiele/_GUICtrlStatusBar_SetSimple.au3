#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGui, $hStatus
	Local $aParts[3] = [75, 150, -1]

	; Erstellt eine GUI
	$hGui = GUICreate("StatusBar: Einfacher Modus setzen", 400, 300)

	$hStatus = _GUICtrlStatusBar_Create($hGui)
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Prüft, ob ein Statusbar-Control sich im einfachen Modus befindet
	; Legt fest, ob ein Statusfenster einfachen Text oder alle Fensterabschnitte darstellen soll
	MemoWrite("Einfacher Modus an .: " & _GUICtrlStatusBar_IsSimple($hStatus))
	Sleep(1000)
	_GUICtrlStatusBar_SetSimple($hStatus, True)
	MemoWrite("Einfacher Modus an .: " & _GUICtrlStatusBar_IsSimple($hStatus))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
