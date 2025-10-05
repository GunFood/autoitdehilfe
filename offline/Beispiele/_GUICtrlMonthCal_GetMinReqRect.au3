#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsStylesConstants.au3>

Global $_g_idLst_Memo

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("Month Calendar: Ermittelt die minimale Größe um einen kompletten Monat darzustellen (v" & @AutoItVersion & ") ", 700, 300)
	Local $idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; Erstellt ein Memo Control
	_MemoCreate(4, 168, 392, 128, 0)
	GUISetState(@SW_SHOW)

	; Ermittelt die minimale Größe um einen kompletten Monat darzustellen
	Local $tRECT = _GUICtrlMonthCal_GetMinReqRect($idMonthCal)
	_MemoWrite("Mindesthöhe  : " & DllStructGetData($tRECT, "Bottom"))
	_MemoWrite("Mindestbreite: " & DllStructGetData($tRECT, "Right"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
