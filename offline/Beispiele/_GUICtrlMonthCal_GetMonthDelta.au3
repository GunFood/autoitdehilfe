#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsStylesConstants.au3>

Global $_g_idLst_Memo

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("MonthCal: Setzt und ermittelt die Datumsdifferenz (v" & @AutoItVersion & ")", 520, 300)
	Local $idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; Erstellt ein Memo Control
	_MemoCreate(4, 168, 412, 128, 0)
	GUISetState(@SW_SHOW)

	; Ermittelt/Setzt die Datumsdifferenz
	_GUICtrlMonthCal_SetMonthDelta($idMonthCal, 2)
	_MemoWrite("Datumsdifferenz: " & _GUICtrlMonthCal_GetMonthDelta($idMonthCal))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
