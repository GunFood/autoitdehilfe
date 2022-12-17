; == Beispiel 4: nur ein Abschnitt

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	; GUI erstellen
	Local $hGUI = GUICreate("StatusBar setzt Abschnitte (v" & @AutoItVersion & ")", 400, 300)
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Memo-Steuerungselement erstellen
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt 5 Abschnitte
	_GUICtrlStatusBar_SetParts($hStatus, 5)
	; Rücksetzung auf nur einen Teil
	_GUICtrlStatusBar_SetParts($hStatus)

	;Text einstellen / Breite abrufen
	Local $iParts = _GUICtrlStatusBar_GetCount($hStatus)
	For $iI = 0 To $iParts - 1
		_GUICtrlStatusBar_SetText($hStatus, "Text " & $iI, $iI)
		MemoWrite("Abschnitt " & $iI & " Breite .: " & _GUICtrlStatusBar_GetWidth($hStatus, $iI))
	Next

	; Schleife, bis der Benutzer beendet
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Benachrichtigung in Memo-Steuerungselement schreiben
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
