#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("Month Calendar: Setzt den Datumsstatus (v" & @AutoItVersion & ")", 400, 300)
	Local $idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_DAYSTATE), 0x00000000)

	; Ermittelt die Nummer der in dem Kalender angezeigten Monate. Normal ist die Zahl 3.
	Local $aMasks[_GUICtrlMonthCal_GetMonthRangeSpan($idMonthCal, True)]

	; Zeigt den ersten, achten und den 16. Tag des Monats im Stil 'fett' an. Dies erzeugt, die binäre Maske von 1000 0000 1000 0001 oder
	; 0x8081 in Hex.
	$aMasks[1] = 0x8081
	_GUICtrlMonthCal_SetDayState($idMonthCal, $aMasks)

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
