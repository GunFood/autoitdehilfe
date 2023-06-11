; == Beispiel 2 direkte Verwendung der Symboldatei

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Ermittelt den Tiptext (v" & @AutoItVersion & ")", 400, 300)
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI, -1, "", $SBARS_TOOLTIPS)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt die Abschnitte
	Local $aParts[4] = [75, 150, 300, 400]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Erzwungene Tips werden anzeigt, wenn der Text nicht in die Box passt", 1)

	; Setzt das Icon
	_GUICtrlStatusBar_SetIcon($hStatus, 0, 23, "shell32.dll")

	; Setzt den Tiptext
	_GUICtrlStatusBar_SetTipText($hStatus, 0, "Tip funktioniert, wenn nur das Icon in dem Abschnitt oder Text die Abschnitte überschreitet")
	_GUICtrlStatusBar_SetTipText($hStatus, 1, "Erzwungene Tips werden anzeigt, wenn der Text nicht in die Box passt")

	MemoWrite("Den Mauszeiger über den Abschnitten halten, um den Tipp anzuzeigen." & @CRLF)

	; Zeigt den Tiptext
	MemoWrite("Tiptext 0 .: " & _GUICtrlStatusBar_GetTipText($hStatus, 0) & @CRLF)
	MemoWrite("Tiptext 1 .: " & _GUICtrlStatusBar_GetTipText($hStatus, 1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
