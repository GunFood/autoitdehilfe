#include "Extras\HelpFileInternals.au3"

#include <ColorConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $idMonthCal

	; Erstellt eine GUI
	GUICreate("Month Calendar: Ermittelt die Farbe für einen festgelegten Abschnitt", 625, 300)
	$idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; Erstellt ein Memo Control
	_MemoCreate(4, 168, 417, 128, BitOR($WS_VSCROLL, $ES_MULTILINE))
	GUICtrlSendMsg($_g_idLst_Memo, $EM_SETREADONLY, True, 0)
	GUICtrlSetBkColor($_g_idLst_Memo, 0xFFFFFF)
	GUISetState(@SW_SHOW)

	_GUICtrlMonthCal_SetColor($idMonthCal, $MCSC_MONTHBK, $CLR_DARKSEAGREEN)

	; Ermittelt Kalender-Farben
	_MemoWrite(_FormatOutPut("Hintergrundfarbe, die zwischen den Monaten dargestellt wird:", _GUICtrlMonthCal_GetColorArray($idMonthCal, $MCSC_BACKGROUND)))
	_MemoWrite(_FormatOutPut(@CRLF & "Hintergrundfarbe, die innerhalb des Monats dargestellt wird:", _GUICtrlMonthCal_GetColorArray($idMonthCal, $MCSC_MONTHBK)))
	_MemoWrite(_FormatOutPut(@CRLF & "Farbe, die verwendet wird, um Text innerhalb eines Monats darzustellen:", _GUICtrlMonthCal_GetColorArray($idMonthCal, $MCSC_TEXT)))
	_MemoWrite(_FormatOutPut(@CRLF & "Hintergrundfarbe, die in dem Titel des Kalenders dargestellt wird:", _GUICtrlMonthCal_GetColorArray($idMonthCal, $MCSC_TITLEBK)))
	_MemoWrite(_FormatOutPut(@CRLF & "Farbe, die verwendet wird, um Text innerhalb des Kalendertitels darzustellen:", _GUICtrlMonthCal_GetColorArray($idMonthCal, $MCSC_TITLETEXT)))
	_MemoWrite(_FormatOutPut(@CRLF & "Farbe für den Text der Vor- und Nachspanntage:", _GUICtrlMonthCal_GetColorArray($idMonthCal, $MCSC_TRAILINGTEXT)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func _FormatOutPut($sText, $aColors)
	Return $sText & _
			@CRLF & @TAB & "COLORREF rgb Farbe:" & @TAB & @TAB & $aColors[1] & _
			@CRLF & @TAB & "Hex BGR Farbe     :" & @TAB & @TAB & $aColors[2] & _
			@CRLF & @TAB & "Hex RGB Farbe     :" & @TAB & @TAB & $aColors[3]
EndFunc   ;==>_FormatOutPut