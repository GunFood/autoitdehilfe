#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $idMonthCal

	; Erstellt eine GUI
	GUICreate("MonthCal: setzt die Farbe", 400, 300)
	$idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 4, 188, 392, 128, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt/Setzt die Kalenderfarbe
	MemoWrite("Hintergrund: 0x" & Hex(_GUICtrlMonthCal_GetColor($idMonthCal, $MCSC_MONTHBK), 6))
	; _GUICtrlMonthCal_SetColor($idMonthCal, $MCSC_MONTHBK, $CLR_MONEYGREEN)
	_GUICtrlMonthCal_SetColor($idMonthCal, $MCSC_TEXT, 0x8BD4DF)
	_GUICtrlMonthCal_SetColor($idMonthCal, $MCSC_TITLEBK, 0xA9D7E4)
	_GUICtrlMonthCal_SetColor($idMonthCal, $MCSC_TITLETEXT, 0x005894)
	_GUICtrlMonthCal_SetColor($idMonthCal, $MCSC_MONTHBK, 0x3F3F3F)
	_GUICtrlMonthCal_SetColor($idMonthCal, $MCSC_TRAILINGTEXT, 0xB2C2A9)
	MemoWrite("Hintergrund: 0x" & Hex(_GUICtrlMonthCal_GetColor($idMonthCal, $MCSC_MONTHBK), 6))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
