#include <GUIConstantsEx.au3>
#include <GuiDateTimePicker.au3>
#include <WinAPIGdi.au3>

Global $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGui = GUICreate("DateTimePick: Setzt und ermittelt die Schriftart des Monatskalenders (v" & @AutoItVersion & ")", 600, 300)
	Local $hDTP = _GUICtrlDTP_Create($hGui, 2, 6, 190)
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; Erstellt eine neue Schrift für das Monats-Control
	Local $tLOGFONT = DllStructCreate($tagLOGFONT)
	DllStructSetData($tLOGFONT, "Height", 13)
	DllStructSetData($tLOGFONT, "Weight", 400)
	DllStructSetData($tLOGFONT, "FaceName", "Verdana")
	Local $hFont = _WinAPI_CreateFontIndirect($tLOGFONT)
	_GUICtrlDTP_SetMCFont($hDTP, $hFont)

	; Ermittelt das Schrifthandle des Monats-Control
	MemoWrite("Schrifthandle: " & "0x" & Hex(_GUICtrlDTP_GetMCFont($hDTP), 6))
	MemoWrite("IsPtr  = " & IsPtr(_GUICtrlDTP_GetMCFont($hDTP)) & " IsHWnd  = " & IsHWnd(_GUICtrlDTP_GetMCFont($hDTP)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
