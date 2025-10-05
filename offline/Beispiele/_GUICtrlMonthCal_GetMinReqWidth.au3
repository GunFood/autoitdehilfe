#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsStylesConstants.au3>

Global $_g_idLst_Memo

Example()

Func Example()
	Local $idMonthCal

	; Erstellt eine GUI
	GUICreate("MonthCal: die minimale Breite, die notwendig ist, um einen kompletten Monat darzustellen ermitteln", 400, 300)
	$idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; Erstellt ein Memo Control
	_MemoCreate(4, 168, 392, 128, 0)
	GUISetState(@SW_SHOW)

	; Ermittelt die minimale Höhe/Breite, die notwendig ist, um einen kompletten Monat darzustellen.
	_MemoWrite("Minimal notwendige Höhe  : " & _GUICtrlMonthCal_GetMinReqHeight($idMonthCal))
	_MemoWrite("Minimal notwendige Breite: " & _GUICtrlMonthCal_GetMinReqWidth($idMonthCal))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
