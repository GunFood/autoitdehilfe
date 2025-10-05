#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $tMin, $tMax, $idMonthCal

	; Erstellt eine GUI
	GUICreate("MonthCal: den oben begrenzten Datumsbereich ermitteln", 400, 300)
	$idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; Erstellt ein Memo Control
	_MemoCreate(4, 168, 392, 128, 0)
	GUISetState(@SW_SHOW)

	; Ermittelt/Setzt den unten begrenzten Datumsbereich
	_GUICtrlMonthCal_SetRange($idMonthCal, @YEAR, 1, 1, @YEAR, 12, 31)
	$tMin = _GUICtrlMonthCal_GetRangeMin($idMonthCal)
	$tMax = _GUICtrlMonthCal_GetRangeMax($idMonthCal)
	_MemoWrite("Minimales auswählbares Datum: " & StringFormat("%02d/%02d/%04d", DllStructGetData($tMin, "Month"), _
			DllStructGetData($tMin, "Day"), _
			DllStructGetData($tMin, "Year")))
	_MemoWrite("Maximales auswählbares Datum: " & StringFormat("%02d/%02d/%04d", DllStructGetData($tMax, "Month"), _
			DllStructGetData($tMax, "Day"), _
			DllStructGetData($tMax, "Year")))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example