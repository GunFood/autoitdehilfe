#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Einfacher Modus aktiv? bzw. setzt den einfachen Modus (v" & @AutoItVersion & ")", 600, 320, 100, 100)

	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)
	Local $aParts[3] = [75, 150, -1]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	; Erstellt ein Memo Control
	_MemoCreate(2, 8, 444, 259)
	GUISetState(@SW_SHOW)

	; Prüft, ob ein Statusbar-Control sich im einfachen Modus befindet
	; Legt fest, ob ein Statusfenster einfachen Text oder alle Fensterabschnitte darstellen soll
	_MemoWrite("Einfacher Modus an .: " & _GUICtrlStatusBar_IsSimple($hStatus))
	Sleep(1000)
	_GUICtrlStatusBar_SetSimple($hStatus, True)
	_MemoWrite("Einfacher Modus an .: " & _GUICtrlStatusBar_IsSimple($hStatus))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example