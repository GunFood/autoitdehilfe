#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $tTime, $idMonthCal

	; Erstellt eine GUI
	GUICreate("MonthCal: Ermittelt das aktuell ausgewählte Datum", 450, 300)
	$idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 4, 168, 392, 128, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt/Setzt das ausgewählte Datum
	_GUICtrlMonthCal_SetCurSel($idMonthCal, @YEAR, 8, 19)
	$tTime = _GUICtrlMonthCal_GetCurSel($idMonthCal)
	MemoWrite("Aktuell ausgewähltes Datum : " & StringFormat("%02d/%02d/%04d", DllStructGetData($tTime, "Month"), _
			DllStructGetData($tTime, "Day"), _
			DllStructGetData($tTime, "Year")))

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
