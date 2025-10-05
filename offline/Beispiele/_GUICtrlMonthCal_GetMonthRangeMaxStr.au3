#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $idMonthCal

	; Erstellt eine GUI
	GUICreate("Month Calendar: Ermittelt Datumsinformationen die das höchste Limit darstellen", 600, 300)
	$idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; Erstellt ein Memo Control
	_MemoCreate(4, 168, 392, 128, 0)
	GUISetState(@SW_SHOW)

	; Ermittelt Datumsinformationen die das höchste Limit darstellen
	_MemoWrite("Niedrigstes Limit: " & _GUICtrlMonthCal_GetMonthRangeMinStr($idMonthCal))
	_MemoWrite("Höchstes Limit: " & _GUICtrlMonthCal_GetMonthRangeMaxStr($idMonthCal))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example