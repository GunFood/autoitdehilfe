#include <GUIConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("MonthCal: Setzt und ermittelt die Farbe (v" & @AutoItVersion & ")", 500, 300)
	Local $idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 4, 188, 392, 128, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt/Setzt die Kalenderfarbe
	MemoWrite("Hintergrund: 0x" & Hex(_GUICtrlMonthCal_GetColor($idMonthCal, $MCSC_MONTHBK), 6))
	_GUICtrlMonthCal_SetColor($idMonthCal, $MCSC_TEXT, 0xB02B00)
	_GUICtrlMonthCal_SetColor($idMonthCal, $MCSC_TITLEBK, 0x5EFFFE)
	_GUICtrlMonthCal_SetColor($idMonthCal, $MCSC_TITLETEXT, 0x0000FF)
	_GUICtrlMonthCal_SetColor($idMonthCal, $MCSC_MONTHBK, 0x87C4FF)
	_GUICtrlMonthCal_SetColor($idMonthCal, $MCSC_TRAILINGTEXT, 0x997777)
	MemoWrite("Hintergrund: 0x" & Hex(_GUICtrlMonthCal_GetColor($idMonthCal, $MCSC_MONTHBK), 6))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
