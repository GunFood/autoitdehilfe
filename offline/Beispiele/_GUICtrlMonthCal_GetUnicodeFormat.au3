#include <GuiConstantsEx.au3>
#include <GuiMonthCal.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("MonthCal: Setzt und ermittelt das Unicode Format (v" & @AutoItVersion & ")", 440, 300)
	Local $idMonthCal = GUICtrlCreateMonthCal("", 4, 4, -1, -1, $WS_BORDER, 0x00000000)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 4, 168, 432, 128, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt/Setzt das Unicode Format
	_GUICtrlMonthCal_SetUnicodeFormat($idMonthCal, False)
	MemoWrite("Unicode: " & _GUICtrlMonthCal_GetUnicodeFormat($idMonthCal))
	_GUICtrlMonthCal_SetUnicodeFormat($idMonthCal, True)
	MemoWrite("Unicode: " & _GUICtrlMonthCal_GetUnicodeFormat($idMonthCal))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
