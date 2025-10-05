#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WinAPIMisc.au3>
#include <WindowsStylesConstants.au3>

Global $g_idMonthCal, $g_hGUI

Example()

Func Example()
	; Erstellt eine GUI
	$g_hGUI = GUICreate("MonthCal: Hit Test (v" & @AutoItVersion & ")", 400, 300)
	$g_idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; Erstellt ein Memo Control
	_MemoCreate(4, 168, 392, 128, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_MOUSEMOVE
				DoHitTest()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>Example

; Hit Test durchführen
Func DoHitTest()
	Local $tHit

	$tHit = _GUICtrlMonthCal_HitTest($g_idMonthCal, _WinAPI_GetMousePosX(True, $g_hGUI), _WinAPI_GetMousePosY(True, $g_hGUI))
	If BitAND(DllStructGetData($tHit, "Hit"), $MCHT_CALENDARDATE) <> 0 Then
		_MemoWrite("Date: " & StringFormat("%02d/%02d/%04d", DllStructGetData($tHit, "Month"), _
				DllStructGetData($tHit, "Day"), _
				DllStructGetData($tHit, "Year")))
	EndIf
EndFunc   ;==>DoHitTest