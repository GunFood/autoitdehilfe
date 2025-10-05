#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("MonthCal: Setzt und ermittelt das Unicode Format (v" & @AutoItVersion & ")", 540, 300)
	Local $idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; Erstellt ein Memo Control
	_MemoCreate(4, 168, 432, 128, 0)
	GUISetState(@SW_SHOW)

	; Ermittelt/Setzt das Unicode Format
	_GUICtrlMonthCal_SetUnicodeFormat($idMonthCal, False)
	_MemoWrite("Unicode: " & _GUICtrlMonthCal_GetUnicodeFormat($idMonthCal))
	_GUICtrlMonthCal_SetUnicodeFormat($idMonthCal, True)
	_MemoWrite("Unicode: " & _GUICtrlMonthCal_GetUnicodeFormat($idMonthCal))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example