#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $sDate

	; Erstellt die GUI
	GUICreate("Zeit", 400, 300)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Anzeigen der FAT Zeit
	$sDate = _Date_Time_DOSTimeToStr(0x944a) ; 18:34:20
	MemoWrite("FAT Zeit .: " & $sDate)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
