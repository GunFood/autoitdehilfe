; == Beispiel 2 direkte Verwendung der Symboldatei

#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Ermittelt den Tiptext (v" & @AutoItVersion & ")", 450, 320, 100, 100)
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI, -1, "", $SBARS_TOOLTIPS)

	; Erstellt ein Memo Control
	_MemoCreate(2, 8, 444, 259)
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

	_MemoWrite("Den Mauszeiger über den Abschnitten halten, um den Tipp anzuzeigen." & @CRLF)

	; Zeigt den Tiptext
	_MemoWrite("Tiptext 0 .: " & _GUICtrlStatusBar_GetTipText($hStatus, 0) & @CRLF)
	_MemoWrite("Tiptext 1 .: " & _GUICtrlStatusBar_GetTipText($hStatus, 1))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example