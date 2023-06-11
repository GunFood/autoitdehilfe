#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $tMin, $tMax, $idMonthCal

	; Erstellt eine GUI
	GUICreate("Month Calendar: Ermittelt niedrigeren Datumsbereich als der aktuell durch den Benutzer markierte", 700, 300)
	$idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Erhält/Setzt eine Makierung
	_GUICtrlMonthCal_SetSelRange($idMonthCal, @YEAR, @MON, 1, @YEAR, @MON, 7)
	$tMin = _GUICtrlMonthCal_GetSelRangeMin($idMonthCal)
	$tMax = _GUICtrlMonthCal_GetSelRangeMax($idMonthCal)
	MemoWrite("Startdatum: " & StringFormat("%02d/%02d/%04d", DllStructGetData($tMin, "Month"), _
			DllStructGetData($tMin, "Day"), _
			DllStructGetData($tMin, "Year")))
	MemoWrite("Enddatum .: " & StringFormat("%02d/%02d/%04d", DllStructGetData($tMax, "Month"), _
			DllStructGetData($tMax, "Day"), _
			DllStructGetData($tMax, "Year")))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
