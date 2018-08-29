#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGui, $hStatus
	Local $aParts[3] = [75, 150, -1]

	; Erstellt eine GUI
	$hGui = GUICreate("StatusBar: Ränder ermitteln", 400, 300)

	$hStatus = _GUICtrlStatusBar_Create($hGui)
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt die aktuelle Breite des horizontalen und vertikalen Randes
	MemoWrite("Breite des horizontalen Randes ...........: " & _GUICtrlStatusBar_GetBordersHorz($hStatus))
	MemoWrite("Breite des vertikalen Randes .............: " & _GUICtrlStatusBar_GetBordersVert($hStatus))
	MemoWrite("Breite des Randes zwischen den Rechtecken : " & _GUICtrlStatusBar_GetBordersRect($hStatus))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
