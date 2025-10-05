#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsStylesConstants.au3>

Global $_g_idLst_Memo

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("MonthCal: Setzt und ermittelt den ersten Tag der Woche (v" & @AutoItVersion & ")", 520, 300)
	Local $idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; Erstellt ein Memo Control
	_MemoCreate(4, 168, 412, 128, 0)
	GUISetState(@SW_SHOW)

	; Erhält/setzt den ersten Tag der Woche
	_GUICtrlMonthCal_SetFirstDOW($idMonthCal, 0)
	_MemoWrite("Erster Tag der Woche : " & _GUICtrlMonthCal_GetFirstDOW($idMonthCal))

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
