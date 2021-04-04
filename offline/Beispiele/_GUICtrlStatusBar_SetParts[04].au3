; == Beispiel 4 nur ein Teil

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGUI, $hStatus

	; GUI erstellen
	$hGUI = GUICreate("StatusBar setzt Teile", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Memo-Steuerungselement erstellen
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setz7 5 Teile
	_GUICtrlStatusBar_SetParts($hStatus, 5)
	; Rücksetzung auf nur einen Teil
	_GUICtrlStatusBar_SetParts($hStatus)

	;Text einstellen / Breite abrufen
	Local $iParts = _GUICtrlStatusBar_GetCount($hStatus)
	For $iI = 1 To $iParts
		_GUICtrlStatusBar_SetText($hStatus, "Text " & $iI, $iI - 1)
		MemoWrite("Teil " & $iI & " Breite .: " & _GUICtrlStatusBar_GetWidth($hStatus, $iI - 1))
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
