#include <ColorConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiDateTimePicker.au3>
#include <MsgBoxConstants.au3>

Global $g_idMemo

_Example() ; Verwendet die internen AutoIt Controls

Func _Example()
	; Erstellt eine GUI
	GUICreate("DateTimePick: Ermittelt / Setzt MCColor (v" & @AutoItVersion & ")", 400, 300)
	Local $hDTP = GUICtrlGetHandle(GUICtrlCreateDate("", 2, 6, 190))
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; Setzt die Hintergrundfarbe des Monatskalenders
	_GUICtrlDTP_SetMCColor($hDTP, 2, $CLR_DARKSEAGREEN)

	; Ermittelt die Farben des DTPs
	MemoWrite("Hintergrund zwischen den Monaten .: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 0), 6))
	MemoWrite("Text innerhalb der Monate ........: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 1), 6))
	MemoWrite("Titelhintergrund .................: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 2), 6))
	MemoWrite("Titeltext ........................: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 3), 6))
	MemoWrite("Hintergrund innerhalb der Monate .: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 4), 6))
	MemoWrite("Text des folgenden Tages .........: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 5), 6))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
