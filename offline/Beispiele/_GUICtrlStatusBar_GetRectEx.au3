#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Ermittelt die Abschnitte (v" & @AutoItVersion & ")", 400, 300)
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt/Ermittelt die Abschnitte
	Local $aParts[3] = [75, 150, -1]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	; Ermittelt das Rechteck von Abschnitt 0
	Local $tRECT = _GUICtrlStatusBar_GetRectEx($hStatus, 0)
	MemoWrite("Abschnitt 0 links ...: " & DllStructGetData($tRECT, "Left"))
	MemoWrite("Abschnitt 0 oben ....: " & DllStructGetData($tRECT, "Top"))
	MemoWrite("Abschnitt 0 rechts ..: " & DllStructGetData($tRECT, "Right"))
	MemoWrite("Abschnitt 0 unten ...: " & DllStructGetData($tRECT, "Bottom"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
