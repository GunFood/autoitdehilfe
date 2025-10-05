#include "Extras\HelpFileInternals.au3"

#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsStylesConstants.au3>

Global $_g_idLst_Memo

Example()

Func Example()
	Local $idMonthCal

	; Erstellt eine GUI
	GUICreate("Month Calendar: Ermittelt die minimale Größe um einen kompletten Monat darzustellen", 650, 300)
	$idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, BitOR($WS_BORDER, $MCS_MULTISELECT), 0x00000000)

	; Erstellt ein Memo Control
	_MemoCreate(4, 168, 392, 128, BitOR($WS_VSCROLL, $ES_MULTILINE))
	GUICtrlSendMsg($_g_idLst_Memo, $EM_SETREADONLY, True, 0)
	GUICtrlSetBkColor($_g_idLst_Memo, 0xFFFFFF)
	GUISetState(@SW_SHOW)

	; Ermittelt die minimale Größe um einen kompletten Monat darzustellen
	_MemoWrite(_FormatOutPut(_GUICtrlMonthCal_GetMinReqRectArray($idMonthCal)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func _FormatOutPut($aRect)
	Return "Mindestbreite: " & @TAB & $aRect[3] & @CRLF & "Mindesthöhe:" & @TAB & $aRect[4]
EndFunc   ;==>_FormatOutPut
