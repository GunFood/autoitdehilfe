#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Ermittelt Textflags (v" & @AutoItVersion & ")", 400, 300)
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt die Abschnitte
	Local $aParts[3] = [75, 150, -1]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 0", 0, $SBT_POPOUT)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1", 1, $SBT_NOBORDERS)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 2, $SBT_NOTABPARSING)

	; Ermittelt Textinformationen
	For $iI = 0 To _GUICtrlStatusBar_GetCount($hStatus) - 1
		MemoWrite("Abschnitt " & $iI & " Textflags : 0x" & Hex(_GUICtrlStatusBar_GetTextFlags($hStatus, $iI)))
		MemoWrite("Abschnitt " & $iI & " Textlänge : " & _GUICtrlStatusBar_GetTextLength($hStatus, $iI))
		MemoWrite("Abschnitt " & $iI & " Textlänge : 0x" & Hex(_GUICtrlStatusBar_GetTextLengthEx($hStatus, $iI)))
		MemoWrite()
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
