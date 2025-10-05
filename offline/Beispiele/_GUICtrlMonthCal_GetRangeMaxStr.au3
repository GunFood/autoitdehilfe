#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $idMonthCal

	; Erstellt eine GUI
	GUICreate("Month Calendar: Ermittelt den oberen begrenzten Datumsbereich", 520, 300)
	$idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; Erstellt ein Memo Control
	_MemoCreate(4, 168, 392, 128, 0)
	GUISetState(@SW_SHOW)

	; Ermittelt den oberen begrenzten Datumsbereich
	_GUICtrlMonthCal_SetRange($idMonthCal, @YEAR, 1, 1, @YEAR, 12, 31)
	_MemoWrite("Minimal auswählbares Datum: " & _GUICtrlMonthCal_GetRangeMinStr($idMonthCal))
	_MemoWrite("Maximal auswählbares Datum: " & _GUICtrlMonthCal_GetRangeMaxStr($idMonthCal))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example