#include <GuiConstantsEx.au3>
#include <GuiDateTimePicker.au3>

Global $_g_idLst_Memo

Example()

Func Example()
	Local $hGui, $hDTP

	; Erstellt eine GUI
	$hGui = GUICreate("DateTimePick: Ermittelt das Child Handle des Monatskalenders", 400, 300)
	$hDTP = _GUICtrlDTP_Create($hGui, 2, 6, 190)
	$_g_idLst_Memo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUICtrlSetFont($_g_idLst_Memo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; Ermittelt das Child Handle des Monatskalenders
	GUICtrlSetData($_g_idLst_Memo, "Child Handle des Monatskalenders: " & "0x" & Hex(_GUICtrlDTP_GetMonthCal($hDTP)), 1)
	GUICtrlSetData($_g_idLst_Memo, " IsPtr=" & IsPtr(_GUICtrlDTP_GetMonthCal($hDTP)), 1)
	GUICtrlSetData($_g_idLst_Memo, " IsHwnd=" & IsHWnd(_GUICtrlDTP_GetMonthCal($hDTP)) & @CRLF, 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
