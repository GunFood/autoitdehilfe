#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $aDate

	; Erstellt die GUI
	GUICreate("Zeit", 400, 300)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Zeigt FAT Datum/Uhrzeit
	$aDate = _Date_Time_DOSDateTimeToArray(0x3621, 0x944a) ; 01/01/2007 18:34:20
	MemoWrite("FAT Datum  :" & StringFormat("%02d.%02d.%04d", $aDate[1], $aDate[0], $aDate[2]))
	MemoWrite("FAT Uhrzeit:" & StringFormat("%02d:%02d:%02d", $aDate[3], $aDate[4], $aDate[5]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Funktion schreibt eine Zeile in das iMemo-Control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
