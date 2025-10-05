; == Beispiel 4: nur ein Abschnitt

#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar setzt Abschnitte (v" & @AutoItVersion & ")", 450, 320, 100, 100)
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Erstellt ein Memo Control
	_MemoCreate(2, 8, 444, 259)
	GUISetState(@SW_SHOW)

	; Setzt 5 Abschnitte
	_GUICtrlStatusBar_SetParts($hStatus, 5)
	; Rücksetzung auf nur einen Teil
	_GUICtrlStatusBar_SetParts($hStatus)

	;Setzt Text und ermittelt die Breite
	Local $iParts = _GUICtrlStatusBar_GetCount($hStatus)
	For $iI = 0 To $iParts - 1
		_GUICtrlStatusBar_SetText($hStatus, "Text " & $iI, $iI)
		_MemoWrite("Abschnitt " & $iI & " Breite .: " & _GUICtrlStatusBar_GetWidth($hStatus, $iI))
	Next

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example