#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $tFileTime1, $tFileTime2

	; Erzeugt die GUI-Oberfläche
	GUICreate("Zeitvergleich", 400, 300)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Vergleiche die FAT Daten/Zeiten der Dateien
	$tFileTime1 = _Date_Time_DOSDateTimeToFileTime(0x3621, 0x11EF) ; 01/01/2007 02:15:30
	$tFileTime2 = _Date_Time_DOSDateTimeToFileTime(0x379F, 0x944A) ; 31/12/2007 18:34:20

	; Schreibt 3 Vergleiche in iMemo-Control
	MemoWrite("Vergleich 1 (1. Datei jünger):" & _Date_Time_CompareFileTime($tFileTime1, $tFileTime2))
	MemoWrite("Vergleich 2 (gleiches Datum) :" & _Date_Time_CompareFileTime($tFileTime1, $tFileTime1))
	MemoWrite("Vergleich 3 (2. Datei jünger):" & _Date_Time_CompareFileTime($tFileTime2, $tFileTime1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Funktion die eine Zeile in das iMemo-Control der GUI-Oberfläche schreibt
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
