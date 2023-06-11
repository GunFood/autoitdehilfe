#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Ermittelt die Höhe / Breite (v" & @AutoItVersion & ")", 500, 300)

	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)
	Local $aParts[3] = [75, 150, -1]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt die Höhe/Breite der einzelnen Abschnitte
	MemoWrite("Höhe der Abschnitte .: " & _GUICtrlStatusBar_GetHeight($hStatus))
	MemoWrite("Breite von Abschnitt 0 .: " & _GUICtrlStatusBar_GetWidth($hStatus, 0))
	MemoWrite("Breite von Abschnitt 1 .: " & _GUICtrlStatusBar_GetWidth($hStatus, 1))
	MemoWrite("Breite von Abschnitt 2 .: " & _GUICtrlStatusBar_GetWidth($hStatus, 2))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
