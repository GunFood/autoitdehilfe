;== Beispiel 2 direkte Verwendung mit Icon-Datei

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Beispiel()

Func Beispiel()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Setzt und ermittelt Text (v" & @AutoItVersion & ")", 400, 300)
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt die Abschnitte
	Local $aParts[4] = [75, 150, 300, 400]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 0")
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1", 1)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 2)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 3", 3)

	; Setzt die Icons
	_GUICtrlStatusBar_SetIcon($hStatus, 0, 23, "shell32.dll")
	_GUICtrlStatusBar_SetIcon($hStatus, 1, 40, "shell32.dll")

	; Zeigt den Text der Abschnitte
	MemoWrite("Text von Abschnitt 0 ........: " & _GUICtrlStatusBar_GetText($hStatus, 0))
	MemoWrite("Text von Abschnitt 1 ........: " & _GUICtrlStatusBar_GetText($hStatus, 1))

	; Zeigt die Handles der Icons
	MemoWrite("Iconhandle Abschnitt 0 .: 0x" & Hex(_GUICtrlStatusBar_GetIcon($hStatus, 0)))
	MemoWrite("Iconhandle Abschnitt 1 .: 0x" & Hex(_GUICtrlStatusBar_GetIcon($hStatus, 1)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Beispiel

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
