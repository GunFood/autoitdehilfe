#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("MonthCal: Setzt und ermittelt die obere und untere Begrenzung des momentan ausgewählten Datumbereichs (v" & @AutoItVersion & ")", 800, 300)
	Local $idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; Erstellt ein Memo Control
	_MemoCreate(4, 168, 392, 128, 0)
	GUISetState(@SW_SHOW)

	; Ermittelt/Setzt die obere und untere Begrenzung des momentan ausgewählten Datumbereichs
	_GUICtrlMonthCal_SetSelRange($idMonthCal, @YEAR, @MON, 1, @YEAR, @MON, 7)
	Local $tRange = _GUICtrlMonthCal_GetSelRange($idMonthCal)
	_MemoWrite("Startdatum: " & StringFormat("%02d/%02d/%04d", DllStructGetData($tRange, "MinMonth"), _
			DllStructGetData($tRange, "MinDay"), _
			DllStructGetData($tRange, "MinYear")))
	_MemoWrite("Enddatum .: " & StringFormat("%02d/%02d/%04d", DllStructGetData($tRange, "MaxMonth"), _
			DllStructGetData($tRange, "MaxDay"), _
			DllStructGetData($tRange, "MaxYear")))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example